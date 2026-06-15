//
//  BannerView.swift
//  CartoonMovies
//
//  Created by mac user on 15/06/2026.
//

import SwiftUI

struct BannerView: View {
    var movieBanner: String
    var movieTitle: String
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {

            MovieImageView(urlPath: movieBanner)
                .frame(height: 200)
                .clipped()

            LinearGradient(
                colors: [
                    .clear,
                    .black.opacity(0.85)
                ],
                startPoint: .top,
                endPoint: .bottom
            )

            VStack(alignment: .leading, spacing: 8) {

                Text(movieTitle)
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)

                Label(
                    "Studio Ghibli",
                    systemImage: "film.fill"
                )
                .foregroundStyle(.white.opacity(0.9))
            }
            .padding()
        }
    }
}

#Preview {
    BannerView(movieBanner: "", movieTitle: "")
}
