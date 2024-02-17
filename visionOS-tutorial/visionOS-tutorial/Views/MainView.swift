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
        GeometryReader { geo in
            MusicNavigationView()
                .toolbar {
                    ToolbarItem(placement: .bottomOrnament) {
                        ControlsBar()
                            .frame(width: geo.size.width*0.8)
                    }
                }
        }
        .environment(model)
        .environment(audioPlayer)
    }
}

#Preview {
    MainView()
        .environment(ViewModel())
        .environment(AudioPlayer())
}
