//
//  FavoritesStorageService.swift
//  CartoonMovies
//
//  Created by mac user on 15/06/2026.
//

import Foundation


protocol FavoritesStorageService {
    func loadFavorites() -> Set<String>
    func saveFavorite(_ favIds: Set<String>) -> Void
}
