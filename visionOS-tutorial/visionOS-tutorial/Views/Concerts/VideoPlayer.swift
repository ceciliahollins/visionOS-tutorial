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
    
    @Environment(ViewModel.self) private var model
    
    var body: some View {
        RealityView { content in
            let video = makeVideoEntity()
            content.add(video)

            video.scale = SIMD3(repeating: 3)
            video.position = [0, 2, -3]
        }
    }
    
    func makeVideoEntity() -> Entity {
        let entity = Entity()
        
        let asset = AVURLAsset(url: Bundle.main.url(forResource: model.currPlayingVideo.videoName,
                                                    withExtension: "MOV")!)
        let playerItem = AVPlayerItem(asset: asset)
        
        let player = AVPlayer()
        var videoPlayerComponent = VideoPlayerComponent(avPlayer: player)
        videoPlayerComponent.isPassthroughTintingEnabled = true
        entity.components[VideoPlayerComponent.self] = videoPlayerComponent
                
        player.replaceCurrentItem(with: playerItem)
        player.play()
        
        return entity
    }
}
