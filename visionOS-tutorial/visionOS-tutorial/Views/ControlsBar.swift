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
            HStack {
                currPlayingSong
                playPauseButton
                expandViewButton
            }
            .padding(.vertical, 6)
            .padding(.horizontal, 48)
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
    }
    
    var playPauseButton: some View {
        @Bindable var audioPlayer = audioPlayer
        
        return Button(action: {
            if audioPlayer.isPlaying {
                audioPlayer.pause()
            } else {
                audioPlayer.play()
            }
        }, label: {
            audioPlayer.controlButtonIcon
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
    }
}

#Preview {
    ControlsBar()
        .environment(ViewModel())
        .environment(AudioPlayer())
}
