//
//  MoviesScreen.swift
//  CartoonMovies
//
//  Created by mac user on 15/06/2026.
//

import SwiftUI

struct MoviesScreen: View {
    
    var movieListVM: MovieListViewModel
    var favoritesVM: FavoritesListVM
    
    var body: some View {
        
        NavigationStack{
            
            VStack{
                switch movieListVM.state {
                case .idle:
                    Text("No Movies yet!.s")
                case .loading:
                    Text("Loading...")
                case .loaded(let array):
                    MovieListView(movies: array, favoritesVM:favoritesVM)
                case .error(let string):
                    Text(string)
                }
            }
            
        }
    }
}

#Preview {
    @State @Previewable var moviesListVM: MovieListViewModel = .init()
    @State @Previewable var favoritesVM: FavoritesListVM = .init()

    MoviesScreen(movieListVM: moviesListVM,favoritesVM:favoritesVM)
}
