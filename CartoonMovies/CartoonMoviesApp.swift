//
//  CartoonMoviesApp.swift
//  CartoonMovies
//
//  Created by mac user on 08/06/2026.
//

import SwiftUI
import Observation

@main
struct CartoonMoviesApp: App {

    var body: some Scene {
        WindowGroup {
            ThemeSwitcher{
                ContentView()
            }
        }
    }
}
