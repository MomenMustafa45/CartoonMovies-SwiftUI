//
//  FavoritesScreen.swift
//  CartoonMovies
//
//  Created by mac user on 14/06/2026.
//

import SwiftUI

struct FavoritesScreen: View {
    var moviesListVM: MovieListViewModel
    var favoritesVM: FavoritesListVM
    
    
    var favoritesMovies: [Movie] {
        switch moviesListVM.state {
        case .loaded(let array):
            return array.filter { favoritesVM.favoriteIds.contains($0.id) }
        default:
            return []
        }
    }
    
    var body: some View {
        NavigationStack{
            VStack{
                if favoritesMovies.isEmpty {
                    ContentUnavailableView("No Favorites yet!", systemImage: "heart")
                } else {
                    MovieListView(movies: favoritesMovies, favoritesVM:favoritesVM)
                }
            }
            .navigationTitle("Favorites Movies")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

#Preview {
    @State @Previewable var moviesListVM: MovieListViewModel = .init()
    @State @Previewable var favoritesVM: FavoritesListVM = .init()
    
    
    FavoritesScreen(moviesListVM: moviesListVM,favoritesVM:favoritesVM)
}
