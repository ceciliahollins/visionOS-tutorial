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
    
    @Environment(ViewModel.self) private var model
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow
    @Environment(\.isPresented) private var isPresented
    
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
            }
        }
        .padding()
        .toolbar(.hidden, for: .navigationBar)
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
                        // TODO: this should not be manually set- see MusicNavigationView
                        model.currSelectedPlaylist = playlist
                        model.currPlayingSong = song
                        openWindow(id: "songDetails")
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
}

#Preview {
    PlaylistView(playlist: MyLibrary.createSeventiesPlaylist())
        .glassBackgroundEffect()
        .environment(ViewModel())
}
