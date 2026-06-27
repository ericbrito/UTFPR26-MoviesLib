//
//  MovieListingRow.swift
//  MoviesLib
//
//  Created by Eric Alves Brito on 27/06/26.
//

import SwiftUI

struct MovieListingRow: View {
    let movie: Movie
    
    var body: some View {
        HStack(spacing: 12) {
            MoviePoster(posterURL: movie.poster)
                .frame(width: 50, height: 80)
                .clipped()
                .cornerRadius(8)
                .shadow(radius: 4, x: 2, y: 2)
            
            Text(movie.title)
            
            Spacer()
            
            Text(movie.finalRating)
        }
    }
}

#Preview {
    MovieListingRow(movie: Movie(title: "Meu filme", poster: "https://m.media-amazon.com/images/M/MV5BNThiYTQzOTUtNmFjYy00OWEwLTg2NWUtMmM3NGE0YjFjOWRjXkEyXkFqcGc@._V1.jpg"))
}
