//
//  ProductionControlsView.swift
//  visionOS-tutorial
//
//  Created by Hollins, Cecilia on 25/2/2024.
//

import SwiftUI

struct ProductionControlsView: View {
    
    @Environment(ProductionPlayer.self) private var productionPlayer
    
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow
        
    var body: some View {
        VStack {
            Text("Adjust the sliders above each instrument to change the volume. Press play when you are ready to hear your production.")
                .font(.title)
                .multilineTextAlignment(.center)
            
            Spacer()
            HStack {
                Button(action: {
                    if productionPlayer.isPlaying {
                        productionPlayer.pause()
                    } else {
                        productionPlayer.play()
                    }
                }, label: {
                    productionPlayer.controlButtonIcon
                        .foregroundStyle(.white)
                        .font(.largeTitle)
                        .padding()
                })
                Spacer()
                Button {
                    productionPlayer.pause()
                    Task {
                        await dismissImmersiveSpace()
                        openWindow(id: "library")
                    }
                    dismissWindow(id: "productionControls")
                } label: {
                    Text("Exit")
                        .font(.headline)
                        .padding()
                }
            }
        }
        .padding(50)
        .glassBackgroundEffect()
    }
}

#Preview {
    ProductionControlsView()
}
