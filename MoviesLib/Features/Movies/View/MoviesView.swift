//
//  MoviesView.swift
//  MoviesLib
//
//  Created by Eric Alves Brito on 27/06/26.
//

import SwiftUI

enum NavigationType: Hashable {
    case details
    case form
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
                .navigationDestination(for: NavigationType.self) { route in
                    switch route {
                    case .details:
                        MovieDetailView()
                    case .form:
                        MovieFormView()
                    }
                }
        }
        .environment(router)
    }
}

#Preview {
    MoviesView()
}
