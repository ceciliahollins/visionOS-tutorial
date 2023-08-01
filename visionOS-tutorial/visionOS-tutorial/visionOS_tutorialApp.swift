//
//  visionOS_tutorialApp.swift
//  visionOS-tutorial
//
//  Created by Hollins, Cecilia on 2/8/2023.
//

import SwiftUI

@main
struct VisionProFirstProjectApp: App {
    
    @State private var model = ViewModel()
    
    var body: some Scene {
        WindowGroup(id: "library") {
            LibraryView()
                .environment(model)
        }
        .windowStyle(.plain)
        
        
        WindowGroup(id: "songDetails") {
            SongDetailView()
                .environment(model)
        }
        .windowStyle(.plain)
    }
}
