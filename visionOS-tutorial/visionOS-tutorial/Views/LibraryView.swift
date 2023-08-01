//
//  ContentView.swift
//  VisionProFirstProject
//
//  Created by Hollins, Cecilia on 27/6/2023.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct LibraryView: View {
    
    @Environment(ViewModel.self) private var model
    @State private var selectedPlaylist: Playlist?
    
    var body: some View {
        @Bindable var model = model
        
        NavigationSplitView {
            List(selection: $selectedPlaylist) {
                ForEach(model.myLibrary.library, id: \.title) { playlist in
                    NavigationLink(value: playlist) {
                        PlaylistTabbarView(playlist: playlist)
                    }
                }
            }
            .navigationTitle("Your Library")
        } detail: {
            PlaylistView(playlist: selectedPlaylist ?? model.myLibrary.library[0])
                .environment(model)
                .toolbar(.hidden, for: .navigationBar)
        }
    }
}

#Preview {
    LibraryView()
        .environment(ViewModel())
}
