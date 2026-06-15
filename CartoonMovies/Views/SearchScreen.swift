//
//  SearchScreen.swift
//  CartoonMovies
//
//  Created by mac user on 14/06/2026.
//

import SwiftUI

struct SearchScreen: View {
  
    
    var moviesListVM: MovieListViewModel
    var favoritesVM: FavoritesListVM
    
    @State private var searchVM: SearchScreenModelView
    
    init(
        moviesListVM: MovieListViewModel,
        favoritesVM: FavoritesListVM
    ) {
        self.moviesListVM = moviesListVM
        self.favoritesVM = favoritesVM
        
        _searchVM = State(
            initialValue: SearchScreenModelView(
                moviesListViewModel: moviesListVM,
                favoritesViewModel: favoritesVM
            )
        )
    }
    
    
    var body: some View {
        NavigationStack{
            Group{
                if searchVM.searchText.isEmpty {
                    ContentUnavailableView("Search for a movie", systemImage: "magnifyingglass")
                } else {
                    MovieListView(movies: searchVM.searchedMovies, favoritesVM: favoritesVM)
                }
            }
            .searchable(text: $searchVM.searchText)
            .task(id: searchVM.searchText) {
                guard !Task.isCancelled else { return }
                await searchVM.searchMovies()
            }
        }
    }
}

#Preview {
    @State @Previewable var moviesListVM: MovieListViewModel = .init()
    
    @State @Previewable var favoritesVM: FavoritesListVM = .init()
    
    SearchScreen(moviesListVM: moviesListVM, favoritesVM: favoritesVM)
}
