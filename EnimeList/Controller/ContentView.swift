//
//  ContentView.swift
//  EnimeList
//
//  Created by Farhandika Zahrir Mufti guenia on 10/07/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var mainAnimeData:MainAnimeModel = MainAnimeModel()
    var body: some View {
        NavigationView {
            TabView {
                Home()
                    .navigationTitle("mememe")
                    .navigationBarHidden(true)
                    .tabItem {
                        Label("Menu", systemImage: "list.dash")
                                    }
                Text("Makan bang")
                    .tabItem {
                        Label("Menu", systemImage: "list.dash")
                        }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
