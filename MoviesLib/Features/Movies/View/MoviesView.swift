//
//  MoviesView.swift
//  MoviesLib
//
//  Created by Eric Alves Brito on 27/06/26.
//

import SwiftUI

enum NavigationType: Hashable {
    case details(Movie)
    case form(Movie?)
}

@Observable
class NavigationRouter {
    var path = NavigationPath()
}

struct MoviesView: View {
    @State private var router = NavigationRouter()
    
    var body: some View {
        NavigationStack(path: $router.path) {
            MovieListingView()
                .navigationTitle("Filmes")
                .navigationDestination(for: NavigationType.self) { route in
                    switch route {
                    case .details(let movie):
                        MovieDetailView(movie: movie)
                    case .form(let movie):
                        MovieFormView(movie: movie)
                    }
                }
                .toolbar {
                    Button("", systemImage: "plus") {
                        router.path.append(NavigationType.form(nil))
                    }
                }
        }
        .environment(router)
    }
}

#Preview {
    MoviesView()
}
