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
        GeometryReader { proxy in
            VStack(spacing: 0) {
                header
                Spacer()
                concertRow
            }
            .background(averageColorFromImage(concert.imageHeader) ?? Color.black)
            .cornerRadius(50)
            .padding(20)
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    var header: some View {
        @Bindable var model = model
        
        return ZStack(alignment: .bottomLeading) {
            Image(concert.imageHeader)
                .resizable()
                .scaledToFit()
                .overlay {
                    LinearGradient(colors: [Color.black, Color.clear], startPoint: .bottom, endPoint: .center)
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
                Spacer()
                ForEach(concert.songs, id: \.songName) { song in
                    Button(action: {
                        // TODO: this should not be manually set- see MusicNavigationView
                        model.currSelectedConcert = concert
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
                    Spacer()
                }
            }
            .padding()
    }
}

#Preview {
    ConcertView(concert: MyConcerts.createGlassAnimalsConcert())
        .glassBackgroundEffect()
        .environment(ViewModel())
}

extension ConcertView {
    
    // https://www.hackingwithswift.com/example-code/media/how-to-read-the-average-color-of-a-uiimage-using-ciareaaverage
    func averageColorFromImage(_ image: String) -> Color? {
        guard let uiImage = UIImage(named: image),
              let inputImage = CIImage(image: uiImage) else { return nil }
        let extentVector = CIVector(x: inputImage.extent.origin.x, y: inputImage.extent.origin.y, z: inputImage.extent.size.width, w: inputImage.extent.size.height)
        
        guard let filter = CIFilter(name: "CIAreaAverage", parameters: [kCIInputImageKey: inputImage, kCIInputExtentKey: extentVector]) else { return nil }
        guard let outputImage = filter.outputImage else { return nil }
        
        var bitmap = [UInt8](repeating: 0, count: 4)
        let context = CIContext(options: [.workingColorSpace: kCFNull])
        context.render(outputImage, toBitmap: &bitmap, rowBytes: 4, bounds: CGRect(x: 0, y: 0, width: 1, height: 1), format: .RGBA8, colorSpace: nil)
        
        return Color(UIColor(red: CGFloat(bitmap[0]) / 255, green: CGFloat(bitmap[1]) / 255, blue: CGFloat(bitmap[2]) / 255, alpha: CGFloat(bitmap[3]) / 255))
    }
}
