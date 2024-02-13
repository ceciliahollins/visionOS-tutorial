//
//  Concert.swift
//  visionOS-tutorial
//
//  Created by Hollins, Cecilia on 15/1/2024.
//

import Foundation
import SwiftUI

struct Concert: Identifiable, Hashable {
    let id = UUID()
    let artist: String
    let songs: [ConcertSong]
    let imageThumbnail: String
    let imageHeader: String
}

struct ConcertSong: Hashable {
    let songName: String
    let videoName: String
    let concertImage: String
}
