//
//  ContentView.swift
//  CartoonMovies
//
//  Created by mac user on 08/06/2026.
//

import SwiftUI

struct ContentView: View {

    
    var moviesListVM = MovieListViewModel()
    var favoritesVM = FavoritesListVM()
    
    var body: some View {
        TabView{
            Tab("Movies", systemImage: "movieclapper.fill"){
                MoviesScreen(movieListVM: moviesListVM, favoritesVM: favoritesVM)
            }
            
            Tab("Favorites", systemImage:  "heart.fill"){
                FavoritesScreen(moviesListVM: moviesListVM, favoritesVM: favoritesVM)
            }
            
            Tab("Settings", systemImage:  "gear.circle.fill"){
                SettingsScreen()
            }
            
            Tab(role: .search){
                SearchScreen(moviesListVM: moviesListVM, favoritesVM: favoritesVM)
            }
        }
        .task {
            await moviesListVM.fetch()
            favoritesVM.loadFavorites()
        }
        
    }
}

#Preview {
    ContentView()
}
