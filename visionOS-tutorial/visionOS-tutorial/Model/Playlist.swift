//
//  Playlist.swift
//  VisionProFirstProject
//
//  Created by Hollins, Cecilia on 28/6/2023.
//

import SwiftUI

struct Playlist: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let description: String
    let coverImage: String
    let songs: [Song]
}

struct Song: Hashable {
    let songTitle: String
    let artist: String
    let albumCover: String
    let songLength: String
    let audioFileName: String
}
