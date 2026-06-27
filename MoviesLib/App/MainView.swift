//
//  MainView.swift
//  MoviesLib
//
//  Created by Eric Alves Brito on 27/06/26.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            MoviesView()
                .tabItem {
                    Label("Filmes", systemImage: "movieclapper.fill")
                }
            MapView()
                .tabItem {
                    Label("Mapa", systemImage: "map.fill")
                }
            SettingsView()
                .tabItem {
                    Label("Ajustes", systemImage: "gearshape")
                }
        }
    }
}

#Preview {
    MainView()
}
