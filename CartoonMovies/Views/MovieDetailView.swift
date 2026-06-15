import SwiftUI

struct MovieDetailView: View {
    
    let movieId: String
    @State var movieDetailVM = MovieDetailViewModel()
    
    var body: some View {
        
        ScrollView {
            
            switch movieDetailVM.movieState {
                
            case .idle:
                
                ContentUnavailableView(
                    "No Movie Selected",
                    systemImage: "film"
                )
                
            case .loading:
                
                VStack(spacing: 16) {
                    
                    ProgressView()
                        .controlSize(.large)
                    
                    Text("Loading Movie...")
                        .font(.headline)
                        .foregroundStyle(.secondary)
                }
                .frame(maxWidth: .infinity)
                .padding(.top, 100)
                
            case .loaded(let movie):
                
                VStack(spacing: 16) {
                    
                    // MARK: Banner
                    
                    BannerView(movieBanner: movie.movieBanner, movieTitle: movie.title)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 30)
                        )
                        .padding(.horizontal)
                    
                    
                    MovieInfoView(director: movie.director, producer: movie.producer, releaseDate: movie.releaseDate)
                    
                    
                    DescriptionView(description: movie.description)
                    
                    MovieCharactersView(movieDetailVM: movieDetailVM)
                    
                }
                .padding(.bottom)
                .task {
                    await movieDetailVM.fetch(for: movie)
                }
                
            case .error(let errorString):
                
                ContentUnavailableView(
                    errorString,
                    systemImage: "exclamationmark.triangle"
                )
            }
        }
        .background(Color(.systemGroupedBackground))
        .navigationBarTitleDisplayMode(.inline)
        .task {
            do {
                try await movieDetailVM.fetchMovieDetails(
                    movieId: movieId
                )
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    NavigationStack {
        MovieDetailView(
            movieId: "2baf70d1-42bb-4437-b551-e5fed5a87abe"
        )
    }
}
