//
//  ProductionRealityView.swift
//  visionOS-tutorial
//
//  Created by Hollins, Cecilia on 25/2/2024.
//

import SwiftUI
import ARKit
import RealityKit

// TODO: Improve functionality with placement of content on specific points in the room
// Need a physical device to do this
// https://developer.apple.com/documentation/visionos/placing-content-on-detected-planes
struct ProductionRealityView: View {
    
    @Environment(ViewModel.self) private var model
    @Environment(ProductionPlayer.self) private var productionPlayer
    
    @State private var microphone = ModelEntity()
    @State private var drums = ModelEntity()
    @State private var bass = ModelEntity()
    @State private var others = ModelEntity()
    
    @State private var vocalsVolume: Float = 1.0
    @State private var drumsVolume: Float = 1.0
    @State private var bassVolume: Float = 1.0
    @State private var othersVolume: Float = 1.0
    
    var body: some View {
        @Bindable var model = model
        @Bindable var productionPlayer = productionPlayer
        
        RealityView { content, _  in
            microphone = try! await ModelEntity(named: "Microphone")
            microphone.scale = SIMD3(repeating: 0.001)
            microphone.position = [-1.5, 1, -2]
            microphone.components.set(InputTargetComponent())
            microphone.collision = CollisionComponent(shapes: [ShapeResource.generateBox(width: 150, height: 600, depth: 100)])
            content.add(microphone)

            drums = try! await ModelEntity(named: "Drums")
            drums.scale = SIMD3(repeating: 0.005)
            drums.position = [-0.5, 1, -2]
            drums.components.set(InputTargetComponent())
            drums.collision = CollisionComponent(shapes: [ShapeResource.generateBox(width: 175, height: 250, depth: 150)])
            content.add(drums)
            
            bass = try! await ModelEntity(named: "Bass")
            bass.scale = SIMD3(repeating: 0.004)
            bass.position = [0.5, 1, -2]
            bass.components.set(InputTargetComponent())
            bass.collision = CollisionComponent(shapes: [ShapeResource.generateBox(width: 200, height: 100, depth: 100)])
            content.add(bass)
            
            others = try! await ModelEntity(named: "Other")
            others.scale = SIMD3(repeating: 0.002)
            others.position = [1.5, 1, -2]
            others.components.set(InputTargetComponent())
            others.collision = CollisionComponent(shapes: [ShapeResource.generateBox(width: 150, height: 200, depth: 150)])
            content.add(others)
        } update: { content, attachments in
            if let microphoneControls = attachments.entity(for: "microphoneControls") {
                microphoneControls.position = microphone.position + [0, 500, 0]
                microphone.addChild(microphoneControls, preservingWorldTransform: true)
            }
            
            if let drumsControls = attachments.entity(for: "drumsControls") {
                drumsControls.position = drums.position + [0, 175, 0]
                drums.addChild(drumsControls, preservingWorldTransform: true)
            }
            
            if let bassControls = attachments.entity(for: "bassControls") {
                bassControls.position = bass.position + [0, 125, 0]
                bass.addChild(bassControls, preservingWorldTransform: true)
            }
            
            if let othersControls = attachments.entity(for: "othersControls") {
                othersControls.position = others.position + [0, 200, 0]
                others.addChild(othersControls, preservingWorldTransform: true)
            }
        } attachments: {
            Attachment(id: "microphoneControls") {
                VStack(spacing: 50) {
                    Slider(value: $vocalsVolume, in: 0.0...1.0)
                        .tint(.accent)
                    Text("Vocals")
                        .font(.extraLargeTitle)
                }
                .padding(100)
                .frame(width: 800)
                .glassBackgroundEffect()
            }
            
            Attachment(id: "drumsControls") {
                VStack(spacing: 50) {
                    Slider(value: $drumsVolume, in: 0.0...1.0)
                        .tint(.accent)
                    Text("Drums")
                        .font(.extraLargeTitle)
                }
                .padding(100)
                .frame(width: 800)
                .glassBackgroundEffect()
            }
            
            Attachment(id: "bassControls") {
                VStack(spacing: 50) {
                    Slider(value: $bassVolume, in: 0.0...1.0)
                        .tint(.accent)
                    Text("Bass")
                        .font(.extraLargeTitle)
                }
                .padding(100)
                .frame(width: 800)
                .glassBackgroundEffect()
            }
            
            Attachment(id: "othersControls") {
                VStack(spacing: 50) {
                    Slider(value: $othersVolume, in: 0.0...1.0)
                        .tint(.accent)
                    Text("Others")
                        .font(.extraLargeTitle)
                }
                .padding(100)
                .frame(width: 800)
                .glassBackgroundEffect()
            }
        }
        .onAppear {
            productionPlayer.loadSongs(model.currSelectedProduction.filesName)
        }
        .gesture(SpatialTapGesture()
            .targetedToEntity(microphone)
            .onEnded { _ in
                vocalsVolume = vocalsVolume == 0.0 ? 1.0 : 0.0
            })
        .gesture(SpatialTapGesture()
            .targetedToEntity(drums)
            .onEnded { _ in
                drumsVolume = drumsVolume == 0.0 ? 1.0 : 0.0
            })
        .gesture(SpatialTapGesture()
            .targetedToEntity(bass)
            .onEnded { _ in
                bassVolume = bassVolume == 0.0 ? 1.0 : 0.0
            })
        .gesture(SpatialTapGesture()
            .targetedToEntity(others)
            .onEnded { _ in
                othersVolume = othersVolume == 0.0 ? 1.0 : 0.0
            })
        .onChange(of: vocalsVolume) { _, newValue in
            productionPlayer.vocalsAudio.volume = newValue
        }
        .onChange(of: drumsVolume) { _, newValue in
            productionPlayer.drumsAudio.volume = newValue
        }
        .onChange(of: bassVolume) { _, newValue in
            productionPlayer.bassAudio.volume = newValue
        }
        .onChange(of: othersVolume) { _, newValue in
            productionPlayer.othersAudio.volume = newValue
        }
    }
}
