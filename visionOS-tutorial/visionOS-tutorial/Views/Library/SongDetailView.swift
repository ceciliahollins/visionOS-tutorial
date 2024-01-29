//
//  SongDetailView.swift
//  VisionProFirstProject
//
//  Created by Hollins, Cecilia on 11/7/2023.
//

import SwiftUI

struct SongDetailView: View {
    
    @Environment(ViewModel.self) private var model
    
    var body: some View {
        @Bindable var model = model
        
        Image(model.currPlayingSong.albumCover)
            .resizable()
            .scaledToFit()
            .imageScale(.large)
            .overlay(content: {
                ZStack(alignment: .leading) {
                    Color.black.opacity(0.5)
                    songDetails
                }
            })
            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 15, height: 0)))
            .frame(width: 400, height: 400)
    }
    
    var songDetails: some View {
        VStack(alignment: .leading) {
            Text("PLAYING FROM PLAYLIST")
                .font(.headline)
                .foregroundStyle(.secondary)
            Text(model.currPlayingPlaylist.title)
                .font(.title)
                .bold()
                .foregroundStyle(.secondary)
            
            Spacer()
            
            Text(model.currPlayingSong.songTitle)
                .font(.extraLargeTitle)
            Text(model.currPlayingSong.artist)
                .font(.extraLargeTitle2)
                .foregroundStyle(.secondary)
        }
        .padding(24)
    }
}

#Preview {
    SongDetailView()
        .environment(ViewModel())
}
