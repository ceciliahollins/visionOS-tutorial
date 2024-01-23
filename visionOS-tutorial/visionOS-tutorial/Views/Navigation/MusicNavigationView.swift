//
//  ContentView.swift
//  VisionProFirstProject
//
//  Created by Hollins, Cecilia on 27/6/2023.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct MusicNavigationView: View {
    
    @Environment(ViewModel.self) private var model
    @State private var selectedPlaylist: Playlist?
    @State private var selectedConcert: String?
    
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace
    @Environment(\.dismissWindow) private var dismissWindow
    
    var body: some View {
        @Bindable var model = model
        
        NavigationSplitView {
            VStack {
                Button {
                    model.currNavigationView = .library
                } label: {
                    Text("Library")
                }
                
                Button {
                    //model.currNavigationView = .concerts
                    Task {
                        // TODO: add error handling
                        await openImmersiveSpace(id: "concert")
                        dismissWindow(id: "library")
                    }
                } label: {
                    Text("Concerts")
                }
                
                switch model.currNavigationView {
                case .library:
                    List(selection: $selectedPlaylist) {
                        ForEach(model.myLibrary.library, id: \.title) { playlist in
                            NavigationLink(value: playlist) {
                                TabbarItem(title: playlist.title,
                                           image: Image(playlist.coverImage))
                            }
                        }
                    }
                case .concerts:
                    List(selection: $selectedConcert) {
                        ForEach(model.myConcerts.concerts, id: \.title) { concert in
                            NavigationLink(value: concert) {
                                TabbarItem(title: concert.title,
                                           image: Image(""))
                            }
                        }
                    }
                }
            }
        } detail: {
            switch model.currNavigationView {
            case .library:
                PlaylistView(playlist: selectedPlaylist ?? model.myLibrary.library[0])
                    .environment(model)
                    .toolbar(.hidden, for: .navigationBar)
            case .concerts:
                EmptyView()
            }
        }
    }
}

#Preview {
    MusicNavigationView()
        .environment(ViewModel())
}
