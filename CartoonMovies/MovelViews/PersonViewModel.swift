import Foundation

enum APIPersonError: LocalizedError {
    case invalidURL
    case invalidResponse
    case decodingError(Error)
    case networkError(Error)
}


@Observable
class PersonViewModel {
    
    enum State {
        case idle
        case loading
        case loaded(Person)
        case error(String)
    }
    
    var state = State.idle
    
    var service: ApiServices
    
    init(service: ApiServices = CartoonMoviesService()) {
        self.service = service
    }
    
    func fetch(personUrl:String) async {
        state = .loading
        
        do {
            let person = try await service.fetchPerson(personUrl: personUrl)
            state = .loaded(person)
        } catch {
            state = .error(error.localizedDescription)
        }
    }
    
   
    
}
