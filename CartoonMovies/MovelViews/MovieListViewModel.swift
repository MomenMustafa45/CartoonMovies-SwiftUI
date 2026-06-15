import Foundation
import Observation
internal import Combine

enum APIError: LocalizedError {
    case invalideURL
    case invalidResponse
    case decoding(Error)
    case networkError(Error)
    
    var errorDescription: String? {
        switch self {
        case .invalideURL:
            return "Invalid URL"
        case .invalidResponse:
            return "Invalid response"
        case .decoding(let error):
            return "Decoding error: \(error.localizedDescription)"
        case .networkError(let error):
            return "Network error: \(error.localizedDescription)"
        }
    }
}

@Observable
class MovieListViewModel {
    enum State: Equatable {
        case idle
        case loading
        case loaded([Movie])
        case error(String)
    }
    
    var state: State = .idle
    
    var service: ApiServices
    
    init(service: ApiServices = CartoonMoviesService()) {
        self.service = service
    }
    
    func fetch() async {
        guard state == .idle else { return }
        
        state = .loading

        do {
            let movies = try await service.fetchMovies()
            self.state = .loaded(movies)
        } catch let error as APIError {
            self.state = .error(error.localizedDescription)
        } catch {
            self.state = .error("unknown error!")

        }
    }
    
}
