//
//  MovieDetailViewModel.swift
//  CartoonMovies
//
//  Created by mac user on 10/06/2026.
//

import Foundation
import Observation

@Observable
class MovieDetailViewModel {
    enum State: Equatable {
        case idle
        case loading
        case loaded([Person])
        case error(String)
    }
    
    enum MovieState: Equatable {
        case idle
        case loading
        case loaded(Movie)
        case error(String)
    }
    
    var movieState: MovieState = MovieState.idle
    var state: State = .idle
    var service: ApiServices
    
    init(service: ApiServices = CartoonMoviesService()) {
        self.service = service
    }
    
    func fetch(for movie: Movie) async {
        guard self.state == .idle else { return }
        
        self.state = .loading
        
        var loadedPeople: [Person] = []
        
        do {
            try await withThrowingTaskGroup(of: Person.self) { group in
                for personUrl in movie.people {
                    group.addTask {
                        try await self.service.fetchPerson(personUrl: personUrl)
                    }
                }
    
                for try await person in group {
                    loadedPeople.append(person)
                }

            }
            self.state = .loaded(loadedPeople)
        } catch let error as APIError {
            self.state = .error(error.localizedDescription)
        } catch {
            self.state = .error("unknown error! \(error.localizedDescription)")
        }
    }
    
    func fetchMovieDetails(movieId: String) async throws  {
        guard self.movieState == .idle else {
            return
        }
        
        self.movieState = .loading
        
        do {
            let movie = try await service.fetchMovieById(id: movieId)
            self.movieState = .loaded(movie)
        } catch let error as DecodingError {
            self.movieState = .error(error.localizedDescription)
        } catch let error as URLError {
            self.movieState = .error(error.localizedDescription)
        } catch {
            self.movieState = .error("unknown error!")
        }
    }
}


