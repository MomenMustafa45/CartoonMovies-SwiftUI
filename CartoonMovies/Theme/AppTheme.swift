//
//  AppTheme.swift
//  CartoonMovies
//
//  Created by mac user on 15/06/2026.
//
import SwiftUI

struct ThemeSwitcher<Content:View>: View {
    @ViewBuilder var content: Content
    @AppStorage("AppTheme") private var appTheme: AppTheme = .systemDefault
    var body: some View {
        content
            .preferredColorScheme(appTheme.colorScheme)
    }
    
}

enum AppTheme: String, CaseIterable {
    case light = "Light"
    case dark = "Dark"
    case systemDefault = "Default"
    
    var colorScheme: ColorScheme? {
        switch self {
        case .light:
            return .light
        case .dark:
            return .dark
        case .systemDefault:
            return nil
        }
    }
}
