//
//  MovieListView.swift
//  CartoonMovies
//
//  Created by mac user on 08/06/2026.
//

import SwiftUI

struct MovieListView: View {

    var movies: [Movie] = []
    var favoritesVM: FavoritesListVM

    var body: some View {

        List {
            ForEach(movies) { movie in

                NavigationLink(value: movie.id) {

                    HStack(spacing: 16) {

                        ZStack(alignment: .topTrailing) {

                            MovieImageView(urlPath: movie.image)
                                .frame(width: 110, height: 165)
                                .clipShape(RoundedRectangle(cornerRadius: 18))
                                .shadow(
                                    color: .black.opacity(0.15),
                                    radius: 8,
                                    x: 0,
                                    y: 5
                                )

                            Button {
                                withAnimation(.spring(response: 0.3)) {
                                    favoritesVM.toggleFavorite(movieId: movie.id)
                                }
                            } label: {
                                Image(
                                    systemName:
                                        favoritesVM.isFavoriteMovie(movieId: movie.id)
                                        ? "heart.fill"
                                        : "heart"
                                )
                                .font(.title3)
                                .foregroundStyle(
                                    favoritesVM.isFavoriteMovie(movieId: movie.id)
                                    ? .red
                                    : .white
                                )
                                .padding(10)
                                .background(.ultraThinMaterial)
                                .clipShape(Circle())
                            }
                            .padding(10)
                            .buttonStyle(.plain)
                        }

                        VStack(alignment: .leading, spacing: 10) {

                            Text(movie.title)
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundStyle(.primary)
                                .multilineTextAlignment(.leading)

                            Spacer()

                            HStack(spacing: 8) {

                                Label("Movie", systemImage: "film.fill")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)

                                Spacer()

                                Image(systemName: "chevron.right")
                                    .font(.caption.weight(.semibold))
                                    .foregroundStyle(.secondary)
                            }
                        }

                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical, 8)
                    }
                    .padding(12)
                    .background(
                        RoundedRectangle(cornerRadius: 24)
                            .fill(Color(.systemBackground))
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 24)
                            .stroke(
                                Color.primary.opacity(0.06),
                                lineWidth: 1
                            )
                    )
                    .shadow(
                        color: .black.opacity(0.08),
                        radius: 12,
                        x: 0,
                        y: 6
                    )
                }
                .buttonStyle(.plain)

                .swipeActions(edge: .trailing, allowsFullSwipe: true) {

                    Button {
                        withAnimation(.spring(response: 0.35)) {
                            favoritesVM.toggleFavorite(movieId: movie.id)
                        }
                    } label: {
                        Label(
                            favoritesVM.isFavoriteMovie(movieId: movie.id)
                            ? "Unfavorite"
                            : "Favorite",
                            systemImage:
                                favoritesVM.isFavoriteMovie(movieId: movie.id)
                                ? "heart.slash.fill"
                                : "heart.fill"
                        )
                    }
                    .tint(
                        favoritesVM.isFavoriteMovie(movieId: movie.id)
                        ? .gray
                        : .red
                    )
                }

                .listRowInsets(
                    EdgeInsets(
                        top: 8,
                        leading: 16,
                        bottom: 8,
                        trailing: 16
                    )
                )
                .listRowSeparator(.hidden)
                .listRowBackground(Color.clear)
            }
        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
        .background(Color(.systemGroupedBackground))
        .navigationDestination(for: String.self) { movieId in
            MovieDetailView(movieId: movieId)
        }
    }
}

#Preview {
    @State @Previewable var favoritesVM: FavoritesListVM = .init()
    
    MovieListView(movies: [Movie.example], favoritesVM: favoritesVM)
}
