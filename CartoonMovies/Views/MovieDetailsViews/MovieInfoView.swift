//
//  MovieInfoView.swift
//  CartoonMovies
//
//  Created by mac user on 15/06/2026.
//

import SwiftUI

struct MovieInfoView: View {
    var director: String
    var producer: String
    var releaseDate: String
    
    
    var body: some View {
        VStack(spacing: 16) {
            
            InfoRow(
                icon: "person.fill",
                title: "Director",
                value: director
            )
            
            InfoRow(
                icon: "building.2.fill",
                title: "Producer",
                value: producer
            )
            
            InfoRow(
                icon: "calendar",
                title: "Release Date",
                value: releaseDate
            )
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 24)
                .fill(.background)
        )
        .shadow(
            color: .black.opacity(0.08),
            radius: 10,
            y: 5
        )
        .padding(.horizontal)

    }
}

#Preview {
    MovieInfoView(director: "", producer: "", releaseDate: "")
}
