//
//  ProductionView.swift
//  visionOS-tutorial
//
//  Created by Hollins, Cecilia on 27/2/2024.
//

import SwiftUI

struct ProductionView: View {
    
    @Environment(ViewModel.self) private var model
    
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow
    
    var body: some View {
        VStack(spacing: 0) {
            header
            concertRow
                .padding()
        }
        .background(averageColorFromImage("producerHeader") ?? Color.black)
        .cornerRadius(40)
        .padding(24)
        .toolbar(.hidden, for: .navigationBar)
    }
    
    var header: some View {
        @Bindable var model = model
        
        return ZStack(alignment: .bottomLeading) {
            Image("producerHeader")
                .resizable()
                .scaledToFit()
                .overlay {
                    LinearGradient(colors: [averageColorFromImage("producerHeader") ?? .black, .clear], startPoint: .bottom, endPoint: .center)
                }
            
            Text("Producer mode")
                .font(.system(size: 75))
                .fontWeight(.heavy)
                .padding()
        }
    }
    
    var concertRow: some View {
        @Bindable var model = model
        
        return HStack(spacing: 0) {
            ForEach(model.myProductions.produtions, id: \.id) { production in
                Button(action: {
                    model.currSelectedProduction = production
                    Task {
                        await openImmersiveSpace(id: "production")
                        dismissWindow(id: "library")
                        dismissWindow(id: "songDetails")
                    }
                    openWindow(id: "productionControls")
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                            .fill(averageColorFromImage(production.albumCover) ?? .white)
                        
                        VStack {
                            Image(production.albumCover)
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(5)
                            
                            Spacer()
                            
                            HStack {
                                Text(production.songName)
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
    ProductionView()
        .environment(ViewModel())
}
