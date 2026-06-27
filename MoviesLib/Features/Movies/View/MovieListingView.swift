//
//  MovieListingView.swift
//  MoviesLib
//
//  Created by Eric Alves Brito on 27/06/26.
//

import SwiftUI

struct MovieListingView: View {
    @State private var viewModel = MovieListingViewModel()
    
    var body: some View {
        Group {
            if viewModel.isLoading {
                ProgressView("Carregando filmes...")
            } else if viewModel.movies.isEmpty {
                Text("Não existem filmes cadastrados!!")
            } else {
                List {
                    ForEach(viewModel.movies) { movie in
                        MovieListingRow(movie: movie)
                    }
                    .onDelete { indexes in
                        Task {
                            await viewModel.deleteMovie(at: indexes)
                        }
                    }
                }
            }
        }
        .task {
            await viewModel.loadMovies()
        }
        .alert("Erro", isPresented: errorBinding) {
            Button("OK") {
                viewModel.errorMessage = nil
            }
        } message: {
            Text(viewModel.errorMessage ?? "")
        }
    }
    
    private var errorBinding: Binding<Bool> {
        Binding(
            get: { viewModel.errorMessage != nil },
            set: { if !$0 { viewModel.errorMessage = nil } }
        )
    }
}

#Preview {
    MovieListingView()
}
