//
//  MainView.swift
//  visionOS-tutorial
//
//  Created by Hollins, Cecilia on 9/2/2024.
//

import SwiftUI

struct MainView: View {
        
    @Environment(ViewModel.self) private var model
    @Environment(AudioPlayer.self) private var audioPlayer
    @Environment(\.openWindow) private var openWindow
    
    var body: some View {
        ZStack {
            MusicNavigationView()
                .environment(model)
                .environment(audioPlayer)
            
            ControlsBar()
                .environment(model)
                .environment(audioPlayer)
                .cornerRadius(50) // TODO: this shouldn't be manually set, figure out how not to extend beyond the window
        }
    }
}

#Preview {
    MainView()
        .environment(ViewModel())
        .environment(AudioPlayer())
}
