//
//  PlaylistView.swift
//  VisionProFirstProject
//
//  Created by Hollins, Cecilia on 29/6/2023.
//

import SwiftUI
import AVFoundation

struct PlaylistView: View {
    
    var playlist: Playlist    
    
    @Environment(ViewModel.self) private var model
    @Environment(AudioPlayer.self) private var audioPlayer
    
    var body: some View {
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
        return ScrollView {
            VStack(spacing: 0) {
                ForEach(playlist.songs, id: \.songTitle) { song in
                    Button(action: {
                        playNewSelectedSong(song)
                    }, label: {
                        HStack {
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
                }
            }
        }
    }
    
    func playNewSelectedSong(_ song: Song) {
        @Bindable var model = model
        @Bindable var audioPlayer = audioPlayer
        // TODO: currSelectedPlaylist should not be manually set- see MusicNavigationView
        model.currSelectedPlaylist = playlist
        model.currPlayingSong = song
        audioPlayer.loadSong(song.audioFileName)
        audioPlayer.play()
    }
}

#Preview {
    PlaylistView(playlist: MyLibrary.createSeventiesPlaylist())
    .glassBackgroundEffect()
    .environment(ViewModel())
    .environment(AudioPlayer())
}
