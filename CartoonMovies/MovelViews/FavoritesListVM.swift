//
//  FavoritesListVM.swift
//  CartoonMovies
//
//  Created by mac user on 15/06/2026.
//

import Foundation
import Observation


@Observable
class FavoritesListVM {
    private(set) var favoriteIds = Set<String>()
    
    private var storageService: FavoriteStorage
    
    init(storageService: FavoriteStorage = FavoriteStorage()) {
        self.storageService = storageService
    }
    
    func loadFavorites() {
        favoriteIds = storageService.loadFavorites()
    }
    
    func saveFavorites() {
        storageService.saveFavorite(favoriteIds)
    }
    
    func toggleFavorite(movieId: String){
        if favoriteIds.contains(movieId) {
            favoriteIds.remove(movieId)
        } else {
            favoriteIds.insert(movieId)
        }
        
        saveFavorites()
    }
    
    func isFavoriteMovie(movieId: String) -> Bool {
        favoriteIds.contains(movieId)
    }
}
