//
//  ViewModel.swift
//  VisionProFirstProject
//
//  Created by Hollins, Cecilia on 29/6/2023.
//

import SwiftUI
import Observation

@Observable
class ViewModel {
    var myLibrary: MyLibrary = MyLibrary()
    var currPlayingPlaylist: Playlist = Playlist(title: "", description: "", coverImage: "", songs: [])
    var currPlayingSong: Song = Song(songTitle: "", artist: "", albumCover: "", songLength: "")
}
