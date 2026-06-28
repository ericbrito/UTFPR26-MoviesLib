//
//  MovieDetailViewModel.swift
//  MoviesLib
//
//  Created by Eric Alves Brito on 27/06/26.
//

import AVKit
import Foundation
import Observation

@Observable
class MovieDetailViewModel {
    let movie: Movie
    var player: AVPlayer?
    var isFavorite: Bool = false
    var isPlaying: Bool = false
    
    init(movie: Movie) {
        self.movie = movie
    }
    
    func setupPlayer() {
        if let trailer = movie.trailer, let url = URL(string: trailer) {
            player = AVPlayer(url: url)
        }
    }
    
    func togglePlayer() {
        if isPlaying {
            player?.pause()
        } else {
            player?.play()
        }
        isPlaying.toggle()
    }
    
    func cleanUp() {
        player?.pause()
        player = nil
        isPlaying = false
    }
}
