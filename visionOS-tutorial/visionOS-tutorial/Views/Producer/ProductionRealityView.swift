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
    
    // create entities for the 4 instruments
    @State private var microphone = ModelEntity()
    @State private var drums = ModelEntity()
    @State private var bass = ModelEntity()
    @State private var others = ModelEntity()
    
    // create variables to track the volume for each instrument
    @State private var vocalsVolume: Float = 1.0
    @State private var drumsVolume: Float = 1.0
    @State private var bassVolume: Float = 1.0
    @State private var othersVolume: Float = 1.0
    
    var body: some View {
        @Bindable var model = model
        @Bindable var productionPlayer = productionPlayer
        
        RealityView { content, _  in
            // load the instruments 3D asset
            microphone = try! await ModelEntity(named: "Microphone")
            // scale the model based on the size of the asset
            microphone.scale = SIMD3(repeating: 0.001)
            // position the model in the users environent
            microphone.position = [-1.5, 1, -2]
            // create a collision box
            // this allows for gestures to be received on the model
            microphone.components.set(InputTargetComponent())
            // currently, a box is generated around the model for the collision
            // it is not a perfectly tight box around the object, but it is close enough
            microphone.collision = CollisionComponent(shapes: [ShapeResource.generateBox(width: 150, height: 600, depth: 100)])
            // use extensions provided by Apple to set light on the model
            microphone.setSunlight(intensity: 10)
            // add the model to the content
            content.add(microphone)

            // repeat the above steps for each instrument
            
            drums = try! await ModelEntity(named: "Drums")
            drums.scale = SIMD3(repeating: 0.005)
            drums.position = [-0.5, 1, -2]
            drums.components.set(InputTargetComponent())
            drums.collision = CollisionComponent(shapes: [ShapeResource.generateBox(width: 175, height: 250, depth: 150)])
            drums.components.set(ImageBasedLightReceiverComponent(imageBasedLight: drums))
            drums.setSunlight(intensity: 10)
            content.add(drums)
            
            bass = try! await ModelEntity(named: "Bass")
            bass.scale = SIMD3(repeating: 0.004)
            bass.position = [0.5, 1, -2]
            bass.components.set(InputTargetComponent())
            bass.collision = CollisionComponent(shapes: [ShapeResource.generateBox(width: 200, height: 100, depth: 100)])
            bass.setSunlight(intensity: 10)
            content.add(bass)
            
            others = try! await ModelEntity(named: "Other")
            others.scale = SIMD3(repeating: 0.002)
            others.position = [1.5, 1, -2]
            others.components.set(InputTargetComponent())
            others.collision = CollisionComponent(shapes: [ShapeResource.generateBox(width: 150, height: 200, depth: 150)])
            others.setSunlight(intensity: 10)
            content.add(others)
        } update: { content, attachments in
            // find the attachment that is created in the attachments closure, using the id to find it
            if let microphoneControls = attachments.entity(for: "microphoneControls") {
                // position the attachment above the respective model
                microphoneControls.position = microphone.position + [0, 500, 0]
                // add the attachment as a child of the model
                microphone.addChild(microphoneControls, preservingWorldTransform: true)
            }
            
            // repeat the above steps for each instrument
            
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
            // create an attachment, assigning it an id value
            Attachment(id: "microphoneControls") {
                // add the desired SwiftUI view
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
            
            // repeat the above steps for each instrument
            
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
        // create spatial tap gestures, adding the target to the model entity
        // the tap is registered when tapped within the model's collision box
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
        // adjust the production player audio based on the state variables
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
