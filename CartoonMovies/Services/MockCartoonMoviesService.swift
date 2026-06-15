//
//  MockCartoonMoviesService.swift
//  CartoonMovies
//
//  Created by mac user on 09/06/2026.
//

import Foundation

struct MockData: Codable {
    let movies: [Movie]
    let people: [Person]
}

class MockCartoonMoviesService: ApiServices {
    func fetchMovieById(id: String) async throws -> Movie {
        guard let url = Bundle.main.url(forResource: "SampleData", withExtension: "json") else {
            throw APIError.invalideURL
        }
        
        do {
            guard let data = try? Data(contentsOf: url) else {
                throw APIError.invalidResponse
            }
            
            let mockData = try JSONDecoder().decode(MockData.self, from: data)
            
            return mockData.movies.first!
        } catch let error as DecodingError {
            throw APIError.decoding(error)
        } catch let error {
            throw APIError.networkError(error)
        }
    }
    
    func fetchMovies() async throws -> [Movie] {
        guard let url = Bundle.main.url(forResource: "SampleData", withExtension: "json") else {
            throw APIError.invalideURL
        }
        
        do {
            guard let data = try? Data(contentsOf: url) else {
                throw APIError.invalidResponse
            }
            
            let mockData = try JSONDecoder().decode(MockData.self, from: data)
            
            return mockData.movies
        } catch let error as DecodingError {
            throw APIError.decoding(error)
        } catch let error {
            throw APIError.networkError(error)
        }
    }
    
    func fetchPerson(personUrl: String) async throws -> Person {
        
        guard let url = Bundle.main.url(forResource: "SampleData", withExtension: "json") else {
            throw APIError.invalideURL
        }
        
        
        do {
            
            
            guard let data = try? Data(contentsOf: url) else {
                throw APIError.invalidResponse
            }
            
            let mockData = try JSONDecoder().decode(MockData.self, from: data)
            
            guard let person =  mockData.people.first(where: { $0.id == personUrl }) else {
                throw APIError.invalidResponse
            }
            
            return person
        } catch let error as DecodingError {
            throw APIError.decoding(error)
        } catch let error {
            throw APIError.networkError(error)
        }
    }
    
    
    
}
