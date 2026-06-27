//
//  MovieFormView.swift
//  MoviesLib
//
//  Created by Eric Alves Brito on 27/06/26.
//

import SwiftUI

struct MovieFormView: View {
    @Environment(NavigationRouter.self) private var router
    
    var body: some View {
        Text("Tela de formulário")
    }
}

#Preview {
    MovieFormView()
        .environment(NavigationRouter())
}
