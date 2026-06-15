//
//  SearchScreenModelView.swift
//  CartoonMovies
//
//  Created by mac user on 15/06/2026.
//

import Foundation
import Observation

@Observable
class SearchScreenModelView {
    var moviesListVM: MovieListViewModel
    var favoritesVM: FavoritesListVM
    
    var searchText: String = ""
    var debouncedSearchText = ""
    var isLoading: Bool = false
    var searchedMovies: [Movie] {
        switch moviesListVM.state {
        case .loaded(let movies):
            guard !debouncedSearchText.isEmpty else { return [] }
            
            return movies.filter {
                $0.title.localizedStandardContains(debouncedSearchText)
            }
        default:
            return []
        }
    }
    
    init(moviesListViewModel: MovieListViewModel , favoritesViewModel: FavoritesListVM) {
        moviesListVM = moviesListViewModel
        favoritesVM = favoritesViewModel
    }
    
    func searchMovies() async {
        try? await Task.sleep(for: .milliseconds(400))
        debouncedSearchText = searchText
    }
    
    
    
}
