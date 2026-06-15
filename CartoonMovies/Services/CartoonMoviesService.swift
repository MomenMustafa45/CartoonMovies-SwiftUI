//
//  MovieListService.swift
//  CartoonMovies
//
//  Created by mac user on 08/06/2026.
//

import Foundation


struct CartoonMoviesService: ApiServices {
    func fetch<T: Decodable>(from URLString:String, type: T.Type) async throws -> T {
        
        guard let url = URL(string:URLString) else {
            throw APIPersonError.invalidURL
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200..<300).contains(httpResponse.statusCode) else {
                throw APIPersonError.invalidResponse
            }
            
            return try JSONDecoder().decode(type, from: data)
        } catch let error as DecodingError {
            throw APIPersonError.decodingError(error)
        } catch let error as URLError {
            throw APIPersonError.networkError(error)
        }
    }
    
    
    func fetchPerson(personUrl: String) async throws -> Person {
        return try await fetch(from: personUrl, type: Person.self)
    }
    
    func fetchMovies() async throws -> [Movie] {
        let url = "https://ghibliapi.vercel.app/films"
        return try await fetch(from: url, type: [Movie].self)
    }
    
    func fetchMovieById(id: String) async throws -> Movie {
        let url = "https://ghibliapi.vercel.app/films/\(id)"
        return try await fetch(from: url, type: Movie.self)
    }
    
}
