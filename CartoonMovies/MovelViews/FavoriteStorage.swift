//
//  FavoriteStorage.swift
//  CartoonMovies
//
//  Created by mac user on 15/06/2026.
//

import Foundation


struct FavoriteStorage: FavoritesStorageService {

    
    private let favoritesKey = "favorites"
    
    func loadFavorites() -> Set<String> {
        let array = UserDefaults.standard.stringArray(forKey: favoritesKey) ?? []
        let arrayOfStrings = Set(array)
        return arrayOfStrings
        
        func saveFavorite(_ favIds: Set<String>) {
            print(favIds)
        }
        
    }
    
    func saveFavorite(_ favIds: Set<String>) {
        UserDefaults.standard.set(Array(favIds), forKey: favoritesKey)
    }
    
}
