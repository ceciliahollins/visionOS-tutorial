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
    var currNavigationView: MusicNavigation = .library
    
    var myLibrary: MyLibrary = MyLibrary()
    var currPlayingPlaylist: Playlist = Playlist(title: "", description: "", coverImage: "", songs: [])
    var currPlayingSong: Song = Song(songTitle: "", artist: "", albumCover: "", songLength: "")
    
    var myConcerts: MyConcerts = MyConcerts()
    var currPlayingVideo: ConcertSong = ConcertSong(songName: "", videoName: "")
}

enum MusicNavigation {
    case library
    case concerts
}
