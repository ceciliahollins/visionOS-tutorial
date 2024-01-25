//
//  PlaylistView.swift
//  VisionProFirstProject
//
//  Created by Hollins, Cecilia on 29/6/2023.
//

import SwiftUI

struct PlaylistView: View {
    
    var playlist: Playlist
    @State private var playlistRowIsFocused: Bool = false
    @State private var showSongDetails: Bool = false
    
    @Environment(ViewModel.self) private var model
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow
    
    var body: some View {
        @Bindable var model = model
        
        GeometryReader { proxy in
            ZStack {
                VStack(alignment: .leading) {
                    playlistHeader
                        .frame(height: proxy.size.height*0.3)
                        .padding()
                    
                    songRow
                        .padding(.leading)
                }
                .onChange(of: showSongDetails) { _, newValue in
                    openWindow(id: "songDetails")
                }
            }
        }
        .padding()
    }
    
    var playlistHeader: some View {
        GeometryReader { proxy in
            HStack(alignment: .bottom) {
                Image(playlist.coverImage)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5, height: 5)))
                    .frame(width: proxy.size.width*0.3)
                
                VStack(alignment: .leading) {
                    Text(playlist.title)
                        .font(.system(size: 75))
                        .fontWeight(.heavy)
                    
                    Text(playlist.description)
                        .font(.title)
                        .foregroundStyle(.secondary)
                }
            }
        }
    }
    
    var songRow: some View {
        @Bindable var model = model
        
        return ScrollView {
            VStack(spacing: 0) {
                ForEach(playlist.songs, id: \.songTitle) { song in
                    Button(action: {
                        showSongDetails = true
                        model.currPlayingSong = song
                        model.currPlayingPlaylist = playlist
                    }, label: {
                        HStack {
                            Image(systemName: playlistRowIsFocused ? "play" : "ellipsis")
                                .padding(.trailing)
                            
                            Image(song.albumCover)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5, height: 5)))
                            
                            VStack(alignment: .leading) {
                                Text(song.songTitle)
                                    .font(.title3)
                                Text(song.artist)
                                    .font(.callout)
                                    .foregroundStyle(.secondary)
                            }
                            
                            Spacer()
                            
                            Text(song.songLength)
                        }
                    })
                    .buttonStyle(.borderless)
                    .buttonBorderShape(.roundedRectangle(radius: 20))
                    .onHover(perform: { hovering in
                        playlistRowIsFocused = hovering
                    })
                }
            }
        }
    }
    
    var songDetails: some View {
        VStack {
            SongDetailView()
            
            Button(action: {
                showSongDetails = false
            }, label: {
                Text("Close")
                    .font(.caption)
            })
        }
        .visualEffect { content, geometryProxy in
            content.offset(z: 400)
        }
    }
}

#Preview {
    PlaylistView(playlist: MyLibrary.createSeventiesPlaylist())
        .environment(ViewModel())
        .glassBackgroundEffect()
}
