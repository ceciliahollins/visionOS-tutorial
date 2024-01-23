//
//  VideoPlayer.swift
//  visionOS-tutorial
//
//  Created by Hollins, Cecilia on 17/1/2024.
//

import SwiftUI
import RealityKit
import AVKit

struct VideoPlayer: View {
    
    var videoName: String
    
    var body: some View {
        let avPlayer = AVPlayer(url:  Bundle.main.url(forResource: videoName, withExtension: "MOV")!)
        
        return CustomVideoPlayer(player: avPlayer)
            .onAppear {
                avPlayer.play()
            }
    }
}

struct CustomVideoPlayer: UIViewControllerRepresentable {
    
    var player: AVPlayer
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        
        controller.player = player
        controller.showsPlaybackControls = false
        
        controller.videoGravity = .resizeAspectFill
        
        player.actionAtItemEnd = .none
        
        NotificationCenter.default.addObserver(context.coordinator, selector: #selector(context.coordinator.restartPlayback), name: .AVPlayerItemDidPlayToEndTime, object: player.currentItem)
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        
    }
    
    class Coordinator: NSObject {
        var parent: CustomVideoPlayer
        init(parent: CustomVideoPlayer) {
            self.parent = parent
        }
        @objc func restartPlayback() {
            parent.player.seek(to: .zero)
        }
    }
}
