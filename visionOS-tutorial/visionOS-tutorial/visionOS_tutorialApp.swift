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
    
    var body: some Scene {
        WindowGroup(id: "library") {
            MusicNavigationView()
                .environment(model)
        }
        .windowStyle(.plain)
        
        WindowGroup(id: "songDetails") {
            SongDetailView()
                .environment(model)
        }
        .windowStyle(.plain)
        
        WindowGroup(id: "concertControls") {
            ConcertControlsView()
        }
        .windowStyle(.plain)
        .defaultSize(width: 100, height: 50)
        
        ImmersiveSpace(id: "concertVideo") {
            VideoPlayer()
                .environment(model)
        }
        .immersionStyle(selection: .constant(.full), in: .full)
    }
}
