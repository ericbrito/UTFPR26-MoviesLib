//
//  MoviePoster.swift
//  MoviesLib
//
//  Created by Eric Alves Brito on 27/06/26.
//

import SwiftUI

struct MoviePoster: View {
    let posterURL: String
    
    var body: some View {
        if let url = URL(string: posterURL) {
            AsyncImage(url: url) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                default:
                    placeholder
                }
            }
        } else {
            placeholder
        }
    }
    
    private var placeholder: some View {
        Image(systemName: "movieclapper")
            .resizable()
            .scaledToFit()
            .foregroundStyle(Color.gray.opacity(0.3))
    }
}

#Preview {
    MoviePoster(posterURL: "https://m.media-amazon.com/images/M/MV5BNThiYTQzOTUtNmFjYy00OWEwLTg2NWUtMmM3NGE0YjFjOWRjXkEyXkFqcGc@._V1.jpg")
}
