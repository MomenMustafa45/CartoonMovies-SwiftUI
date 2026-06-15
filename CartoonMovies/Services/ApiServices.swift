//
//  ApiServices.swift
//  CartoonMovies
//
//  Created by mac user on 08/06/2026.
//

import Foundation


protocol ApiServices: Sendable {
    func fetchMovies() async throws -> [Movie]
    func fetchMovieById(id: String) async throws -> Movie
    func fetchPerson(personUrl: String) async throws -> Person
}
