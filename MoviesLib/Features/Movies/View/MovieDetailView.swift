//
//  MovieDetailView.swift
//  MoviesLib
//
//  Created by Eric Alves Brito on 27/06/26.
//

import SwiftUI

struct MovieDetailView: View {
    @Environment(NavigationRouter.self) private var router
    
    var body: some View {
        Text("Tela de detalhes")
    }
}

#Preview {
    MovieDetailView()
        .environment(NavigationRouter())
}
