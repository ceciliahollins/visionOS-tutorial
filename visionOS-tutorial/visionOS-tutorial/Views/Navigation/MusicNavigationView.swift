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
    @State private var selectedProduction: Production?
    
    var body: some View {
        @Bindable var model = model
        
        TabView {
            playlists
                .tabItem {
                    Label(
                        title: { Text("Listen to Playlists") },
                        icon: { Image(systemName: "music.note") }
                    )
                }
            
            concerts
                .tabItem {
                    Label(
                        title: { Text("Attend a Concert") },
                        icon: { Image(systemName: "music.mic") }
                    )
                }
            
            productions
                .tabItem {
                    Label(
                        title: { Text("Be a Producer") },
                        icon: { Image(systemName: "headphones") }
                    )
                }
        }
        .environment(model)
        .environment(audioPlayer)
    }
    
    var playlists: some View {
        @Bindable var model = model
        
        return NavigationSplitView {
            List(selection: $selectedPlaylist) {
                ForEach(model.myLibrary.library, id: \.id) { playlist in
                    NavigationLink(value: playlist) {
                        TabbarItem(title: playlist.title,
                                   image: Image(playlist.coverImage))
                    }
                }
            }
            .padding(.vertical, 42)
            .toolbar(.hidden)
        } detail: {
            PlaylistView(playlist: selectedPlaylist ?? model.myLibrary.library[0])
        }
    }
    
    var concerts: some View {
        @Bindable var model = model
        
        return NavigationSplitView {
            List(selection: $selectedConcert) {
                ForEach(model.myConcerts.concerts, id: \.id) { concert in
                    NavigationLink(value: concert) {
                        TabbarItem(title: concert.artist,
                                   image: Image(concert.imageThumbnail))
                    }
                }
            }
            .padding(.vertical, 42)
            .toolbar(.hidden)
        } detail: {
            ConcertView(concert: selectedConcert ?? model.myConcerts.concerts[0])
        }
    }
    
    var productions: some View {
        @Bindable var model = model
        
        return ProductionView()

    }
}

#Preview {
    MusicNavigationView()
        .environment(ViewModel())
        .environment(AudioPlayer())
}
