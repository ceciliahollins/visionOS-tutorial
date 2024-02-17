//
//  VideoPlayer.swift
//  visionOS-tutorial
//
//  Created by Hollins, Cecilia on 17/1/2024.
//

import SwiftUI
import UIKit
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
        @Bindable var model = model

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
        
        // create curve plane
        let mesh = generateCurveMesh()
        
        // create a videoMaterial
        let material = VideoMaterial(avPlayer: player)
        
        // add the component to the video entity
        //videoEntity.components.set(videoComponent)
        videoEntity.components.set(ModelComponent(mesh: mesh, materials: [material]))
        
        // scale and position the entity
        videoEntity.scale = SIMD3(repeating: 1)
        videoEntity.position = [0, 1, -2]
               
        // play the video
        player.replaceCurrentItem(with: playerItem)
        player.play()
        
        return videoEntity
    }
    
    // https://maxxfrazer.medium.com/getting-started-with-realitykit-procedural-geometries-5dd9eca659ef
    func generateCurveMesh() -> MeshResource {
        // configurable variables
        
        // higher number = more intense curve
        let curveIntensity = 0.25
        // pick the width, the height is calculated by aspect ratio
        let videoWidth = 3.0
        
        // create an array of vertex positions
        // the vertices will be created in pairs of two, which will create a vertical line
        // the vertical lines will make a parabola curve
        
        // calculate the height based on a horizontal aspect ratio
        let videoHeight = (videoWidth * 9.0) / 16.0
        // create an array of x, y, and z vertex positions
        var positions: [SIMD3<Float>] = []
        // the middle of the video will be at x = 0, start on the left
        var x = -videoWidth/2
        while x <= videoWidth/2 {
            // parabola equation: z = a * x^2
            let z = curveIntensity * pow(x, 2)
            // add the top and bottom vertex of the vertica line
            positions.append(contentsOf: [[Float(x), Float(videoHeight), Float(z)], [Float(x), 0, Float(z)]])
            // move right, the smaller the number the smoother the curve
            x += 0.01
        }
        
        // create the Mesh from MeshDescriptors
        // the mesh is made up of triangles, the vertices will be iterated and will create two triangles at a time to be a rectangle
        // the rectangles will band together to be one big curved plane
        // 4 vertices are needed at a time to create two triangles/one rectangle
        // note: the triangles must be drawn counter clockwise for the mesh to be facing towards the user
        
        // create an array for the MeshDescriptors- these will make up the entire mesh
        var meshDescriptors: [MeshDescriptor] = []
        // start at the fourth vertex
        var i = 3
        while i < positions.count {
            // get the 4 vertices needed to draw the triangles
            let zero = positions[i-3] // top left vertex
            let one = positions[i-2] // bottom left vertex
            let two = positions[i-1] // top right vertex
            let three = positions[i] // bottom right vertex
            
            // this is used for the texture coordinates, it tells the mesh where on the video it will be placed
            // the bottom left of the video will be 0,0 and the top right will be 1,1
            // do some maths to convert the vertex position into an x position on the video
            let x1: Float = (zero.x + Float(videoWidth/2))/Float(videoWidth)
            let x2: Float = (two.x + Float(videoWidth/2))/Float(videoWidth)

            // create the left triangle
            var triangleOne = MeshDescriptor(name: "curve\(i-1)")
            // draw the triangle counter clockwise
            triangleOne.positions = MeshBuffers.Positions([zero, one, two])
            triangleOne.primitives = .triangles([0, 1, 2])
            // use the calculates to determine where each vertex will be placed on the video
            triangleOne.textureCoordinates = MeshBuffer([[x1, 1],
                                                         [x1, 0],
                                                         [x2, 1]])
            
            // create the right triangle
            var triangleTwo = MeshDescriptor(name: "curve\(i)")
            // draw the triangle counter clockwise
            triangleTwo.positions = MeshBuffers.Positions([three, two, one])
            triangleTwo.primitives = .triangles([0, 1, 2])
            // use the calculates to determine where each vertex will be placed on the video
            triangleTwo.textureCoordinates = MeshBuffer([[x2, 0],
                                                         [x2, 1],
                                                         [x1, 0]])
            
            // add the two triangles to the mesh descriptors array
            meshDescriptors.append(contentsOf: [triangleOne, triangleTwo])
            
            // move to the top of next vertical line (2 vertices away)
            i += 2
        }
        
        // generate the mesh from the mesh descriptors and return
        return try! .generate(from: meshDescriptors)
    }
}
