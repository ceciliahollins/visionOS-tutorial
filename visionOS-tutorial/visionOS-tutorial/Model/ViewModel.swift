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
    var musicIsPlaying: Bool = false
    
    var currNavigationView: MusicNavigation = .library
    
    var myLibrary: MyLibrary = MyLibrary()
    var currSelectedPlaylist: Playlist = Playlist(title: "", description: "", coverImage: "", songs: [])
    var currPlayingSong: Song = Song(songTitle: "", artist: "", albumCover: "", songLength: "", audioFileName: "")
    
    var myConcerts: MyConcerts = MyConcerts()
    var currSelectedConcert: Concert = Concert(artist: "", songs: [], imageThumbnail: "", imageHeader: "")
    var currPlayingVideo: ConcertSong = ConcertSong(songName: "", videoName: "", concertImage: "")
}

enum MusicNavigation {
    case library
    case concerts
}
