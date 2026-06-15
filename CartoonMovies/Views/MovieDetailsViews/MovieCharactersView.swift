//
//  MovieCharactersView.swift
//  CartoonMovies
//
//  Created by mac user on 15/06/2026.
//

import SwiftUI

struct MovieCharactersView: View {
    var movieDetailVM: MovieDetailViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            HStack {
                
                Image(systemName: "person.3.fill")
                
                Text("Characters")
                    .font(.title2.bold())
            }
            
            switch movieDetailVM.state {
                
            case .idle:
                
                Text("No characters loaded")
                    .foregroundStyle(.secondary)
                
            case .loading:
                
                ProgressView()
                
            case .loaded(let peopleArray):
                
                LazyVStack(spacing: 12) {
                    
                    ForEach(peopleArray) { person in
                        
                        HStack(spacing: 12) {
                            
                            Image(
                                systemName:
                                    "person.crop.circle.fill"
                            )
                            .font(.system(size: 42))
                            .foregroundStyle(.blue)
                            
                            VStack(
                                alignment: .leading,
                                spacing: 4
                            ) {
                                
                                Text(person.name)
                                    .font(.headline)
                            }
                            
                            Spacer()
                            
//                            Image(
//                                systemName:
//                                    "chevron.right"
//                            )
//                            .foregroundStyle(.secondary)
                        }
                        .padding()
                        .background(
                            RoundedRectangle(
                                cornerRadius: 18
                            )
                            .fill(.background)
                        )
                        .shadow(
                            color: .black.opacity(0.06),
                            radius: 6,
                            y: 3
                        )
                    }
                }
                
            case .error(let error):
                
                ContentUnavailableView(
                    error,
                    systemImage: "exclamationmark.triangle"
                )
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    @State @Previewable var movieDetailVM = MovieDetailViewModel()
    
    MovieCharactersView(movieDetailVM:movieDetailVM)
}
