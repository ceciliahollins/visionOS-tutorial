//
//  ConcertView.swift
//  visionOS-tutorial
//
//  Created by Hollins, Cecilia on 15/1/2024.
//

import SwiftUI

struct ConcertView: View {
    
    var concert: Concert
    @State private var concertRowIsFocused: Bool = false
    
    @Environment(ViewModel.self) private var model
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow
    
    var body: some View {
        songRow
    }
    
    var songRow: some View {
        @Bindable var model = model
        
        return ScrollView {
            VStack(spacing: 0) {
                ForEach(concert.songs, id: \.songName) { song in
                    Button(action: {
                        model.currPlayingVideo = song
                        Task {
                            // TODO: add error handling
                            await openImmersiveSpace(id: "concertVideo")
                            dismissWindow(id: "library")
                        }
                        openWindow(id: "concertControls")
                    }, label: {
                        Text(song.songName)
                    })
                    .buttonStyle(.borderless)
                    .buttonBorderShape(.roundedRectangle(radius: 20))
                    .onHover(perform: { hovering in
                        concertRowIsFocused = hovering
                    })
                }
            }
        }
    }
}
