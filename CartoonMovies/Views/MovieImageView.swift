//
//  MovieImageView.swift
//  CartoonMovies
//
//  Created by mac user on 14/06/2026.
//

import SwiftUI

struct MovieImageView: View {
    var urlPath: String
    
    var body: some View {
        AsyncImage(url: URL(string:urlPath)) {
            phase in
            switch phase {
            case .empty:
                Color(white:0.8)
                    .overlay {
                        ProgressView()
                            .controlSize(.regular)
                    }
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
            case .failure:
                Text("Could not get image.")
                
            @unknown default:
                fatalError()
            }
            
        }
    }
}

#Preview {
    MovieImageView(urlPath: "")
}
