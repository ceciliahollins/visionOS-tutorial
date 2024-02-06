//
//  ConcertControlsView.swift
//  visionOS-tutorial
//
//  Created by Hollins, Cecilia on 25/1/2024.
//

import SwiftUI

struct ConcertControlsView: View {
    
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow
    
    var body: some View {
        VStack {
            Button {
                Task {
                    await dismissImmersiveSpace()
                    dismissWindow(id: "concertControls")
                }
                openWindow(id: "library")
            } label: {
                Text("exit concert")
            }

        }
    }
}
