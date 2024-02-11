//
//  ControlsBar.swift
//  visionOS-tutorial
//
//  Created by Hollins, Cecilia on 12/2/2024.
//

import SwiftUI

struct ControlsBar: View {
    
    @Environment(ViewModel.self) private var model
    @Environment(AudioPlayer.self) private var audioPlayer
    @Environment(\.openWindow) private var openWindow
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                Spacer()
                
                HStack {
                    currPlayingSong
                        .frame(width: geo.size.width/3)
                    playPauseButton
                        .frame(width: geo.size.width/3)
                    expandViewButton
                        .frame(width: geo.size.width/3)
                }
                .padding(.vertical)
                .background(.accent)
            }
        }
    }
    
    var currPlayingSong: some View {
        @Bindable var model = model
        
        return HStack {
            Image(model.currPlayingSong.albumCover)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 5, height: 5)))
            
            VStack(alignment: .leading) {
                Text(model.currPlayingSong.songTitle)
                    .font(.title3)
                Text(model.currPlayingSong.artist)
                    .font(.callout)
                    .foregroundStyle(.secondary)
            }
            Spacer()
        }
        .padding(.leading, 36)
    }
    
    var playPauseButton: some View {
        @Bindable var model = model
        @Bindable var audioPlayer = audioPlayer
        
        return Button(action: {
            if model.musicIsPlaying {
                model.musicIsPlaying = false
                audioPlayer.pause()
            } else {
                model.musicIsPlaying = true
                audioPlayer.play()
            }
        }, label: {
            Image(systemName: model.musicIsPlaying ? "pause.fill" : "play.fill")
                .foregroundStyle(.white)
                .font(.largeTitle)
        })
    }
    
    var expandViewButton: some View {
        HStack {
            Spacer()
            Button (action: {
                openWindow(id: "songDetails")
            }, label: {
                Image(systemName: "arrow.up.backward.and.arrow.down.forward")
                    .foregroundStyle(.white)
                    .font(.largeTitle)
            })
        }
        .padding(.trailing, 36)
    }
}

#Preview {
    ControlsBar()
        .environment(ViewModel())
        .environment(AudioPlayer())
}
