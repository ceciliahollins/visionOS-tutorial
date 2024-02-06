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
        }
    }
    
    func makeVideoEntity() -> Entity {
        // create the video entity
        let videoEntity = Entity()

        // load the asset and add it to AVPlayer
        let asset = AVURLAsset(url: Bundle.main.url(forResource: model.currPlayingVideo.videoName,
                                                    withExtension: "MOV")!)
        let playerItem = AVPlayerItem(asset: asset)
        let player = AVPlayer()
        
        // create the video component
        var videoComponent = VideoPlayerComponent(avPlayer: player)
        videoComponent.isPassthroughTintingEnabled = true
        
        // add the component to the video entity
        videoEntity.components.set(videoComponent)
        
        // scale and position the entity
        videoEntity.scale = SIMD3(repeating: 3)
        videoEntity.position = [-0.4, 2, -3]
               
        // play the video
        player.replaceCurrentItem(with: playerItem)
        player.play()

        return videoEntity
        
        // TODO: attempt to use more advanced components to curve the video
        // https://developer.apple.com/forums/thread/734081
    }
}
