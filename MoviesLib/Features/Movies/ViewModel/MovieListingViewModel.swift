//
//  MovieListingViewModel.swift
//  MoviesLib
//
//  Created by Eric Alves Brito on 27/06/26.
//

import Foundation
import Observation

@Observable
class MovieListingViewModel {
    private(set) var movies: [Movie] = []
    var isLoading = true
    var errorMessage: String?
    
    private let service = MovieAPIService()
    
    func loadMovies() async {
        isLoading = true
        errorMessage = nil
        
        defer { isLoading = false }
        
        do {
            movies = try await service.getMovies()
        } catch {
            if let error = error as? MovieAPIError {
                errorMessage = error.errorDescription
            }
        }
    }
    
    func deleteMovie(at indexes: IndexSet) async {
        errorMessage = nil
        
        for index in indexes {
            do {
                try await service.deleteMovie(movies[index])
                movies.remove(at: index)
            } catch {
                if let error = error as? MovieAPIError {
                    errorMessage = error.errorDescription
                }
            }
        }
        
//        await loadMovies()
    }
}
