//
//  SettingsViewModel.swift
//  CartoonMovies
//
//  Created by mac user on 15/06/2026.
//

import Foundation
import Observation

@Observable
class SettingsViewModel {
    var isDarkMode = false
    var username: String = ""
    var itemsPerPage = 20
    var notificationEnabled = false
    
}
