//
//  PlaylistTabbarView.swift
//  VisionProFirstProject
//
//  Created by Hollins, Cecilia on 5/7/2023.
//

import SwiftUI

struct PlaylistTabbarView: View {
    
    var playlist: Playlist
    
    var body: some View {
        GeometryReader { proxy in // 1
            HStack(alignment: .bottom) {
                Image(playlist.coverImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: proxy.size.width*0.2) // 1
                
                Text(playlist.title)
                    .font(.body)
                
                Spacer()
            }
        }
    }
}

#Preview {
    PlaylistTabbarView(playlist: Playlist(title: "", description: "", coverImage: "", songs: []))
}
