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
    @Environment(AudioPlayer.self) private var audioPlayer
    
    @State private var selectedPlaylist: Playlist?
    @State private var selectedConcert: Concert?
        
    var body: some View {
        @Bindable var model = model
        
        NavigationSplitView {
            VStack {
                Button {
                    model.currNavigationView = .library
                } label: {
                    Text("Library")
                        .frame(maxWidth: .infinity)
                }
                .padding(.horizontal)
                
                Button {
                    model.currNavigationView = .concerts
                } label: {
                    Text("Concerts")
                        .frame(maxWidth: .infinity)
                }
                .padding(.horizontal)
                .padding(.bottom)
                
                switch model.currNavigationView {
                case .library:
                    // TODO: visionOS is having binding issues with using the model directly, figure out why
                    List(selection: $selectedPlaylist) {
                        ForEach(model.myLibrary.library, id: \.id) { playlist in
                            NavigationLink(value: playlist) {
                                TabbarItem(title: playlist.title,
                                           image: Image(playlist.coverImage))
                            }
                        }
                    }
                case .concerts:
                    // TODO: visionOS is having binding issues with using the model directly, figure out why
                    List(selection: $selectedConcert) {
                        ForEach(model.myConcerts.concerts, id: \.id) { concert in
                            NavigationLink(value: concert) {
                                TabbarItem(title: concert.artist,
                                           image: Image(concert.imageThumbnail))
                            }
                        }
                    }
                }
            }
            .toolbar(.hidden)
            .padding()
        } detail: {
            switch model.currNavigationView {
            case .library:
                PlaylistView(playlist: selectedPlaylist ?? model.myLibrary.library[0])
            case .concerts:
                ConcertView(concert: selectedConcert ?? model.myConcerts.concerts[0])
            }
        }
    }
}

#Preview {
    MusicNavigationView()
        .environment(ViewModel())
        .environment(AudioPlayer())
}
