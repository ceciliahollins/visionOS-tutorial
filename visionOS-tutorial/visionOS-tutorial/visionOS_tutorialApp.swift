//
//  visionOS_tutorialApp.swift
//  visionOS-tutorial
//
//  Created by Hollins, Cecilia on 2/8/2023.
//

import SwiftUI
import AVFoundation

@main
struct VisionProFirstProjectApp: App {
    
    @State private var model = ViewModel()
    @State private var audioPlayer: AudioPlayer = AudioPlayer()
    @State private var productionPlayer: ProductionPlayer = ProductionPlayer()
    
    init() {
        // give an initial song to play on first load
        model.currPlayingSong = MyLibrary.createSeventiesPlaylist().songs.first!
        // load up the new song to the audio player
        audioPlayer.loadSong(model.currPlayingSong.audioFileName)
    }
    
    var body: some Scene {
        
        // MARK: Playlists
        
        WindowGroup(id: "library") {
            MainView()
                .environment(model)
                .environment(audioPlayer)
        }
        .windowStyle(.plain)
        
        WindowGroup(id: "songDetails") {
            SongDetailView()
                .environment(model)
        }
        .windowStyle(.plain)
        
        // MARK: Concerts
        
        ImmersiveSpace(id: "concertVideo") {
            ConcertRealityView()
                .environment(model)
        }
        .immersionStyle(selection: .constant(.full), in: .full)
        
        WindowGroup(id: "concertControls") {
            ConcertControlsView()
        }
        .windowStyle(.plain)
        .defaultSize(width: 100, height: 50)
        
        // MARK: Productions
        
        ImmersiveSpace(id: "production") {
            ProductionRealityView()
                .environment(model)
                .environment(productionPlayer)
        }
        
        WindowGroup(id: "productionControls") {
            ProductionControlsView()
                .environment(productionPlayer)
        }
        .windowStyle(.plain)
        .defaultSize(width: 450, height: 350)
    }
}
