//
//  ConcertView.swift
//  visionOS-tutorial
//
//  Created by Hollins, Cecilia on 15/1/2024.
//

import SwiftUI
import AVFoundation

struct ConcertView: View {
    
    var concert: Concert
    
    @Environment(ViewModel.self) private var model
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow
    
    var body: some View {
        VStack(spacing: 0) {
            header
            concertRow
                .padding()
        }
        .background(averageColorFromImage(concert.imageHeader) ?? Color.black)
        .cornerRadius(40)
        .padding(24)
        .toolbar(.hidden, for: .navigationBar)
    }
    
    var header: some View {
        @Bindable var model = model
        
        return ZStack(alignment: .bottomLeading) {
            Image(concert.imageHeader)
                .resizable()
                .scaledToFit()
                .overlay {
                    LinearGradient(colors: [averageColorFromImage(concert.imageHeader) ?? .black, .clear], startPoint: .bottom, endPoint: .center)
                }
            
            Text(concert.artist)
                .font(.system(size: 75))
                .fontWeight(.heavy)
                .padding()
        }
    }
    
    var concertRow: some View {
        @Bindable var model = model
        
        return HStack(spacing: 0) {
                ForEach(concert.songs, id: \.songName) { song in
                    Button(action: {
                        // TODO: this should not be manually set- see MusicNavigationView
                        model.currSelectedConcert = concert
                        model.currPlayingVideo = song
                        Task {
                            await openImmersiveSpace(id: "concertVideo")
                            dismissWindow(id: "library")
                            dismissWindow(id: "songDetails")
                        }
                        openWindow(id: "concertControls")
                    }, label: {
                        ZStack {
                            RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                                .fill(averageColorFromImage(song.concertImage) ?? .white)
                            
                            VStack {
                                Image(song.concertImage)
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(5)
                                
                                Spacer()
                                
                                HStack {
                                    Text(song.songName)
                                        .font(.title)
                                        .lineLimit(1)
                                    Spacer()
                                }
                            }
                            .padding()
                        }
                    })
                    .buttonBorderShape(.roundedRectangle(radius: 10))
                    .buttonStyle(.borderless)
                    .padding(.horizontal)
                    .hoverEffectDisabled()
                }
        }
        .padding()
    }
}

#Preview {
    ConcertView(concert: MyConcerts.createGlassAnimalsConcert())
        .environment(ViewModel())
}
