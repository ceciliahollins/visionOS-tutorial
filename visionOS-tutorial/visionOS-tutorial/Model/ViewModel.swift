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
    // MARK: Library
    var myLibrary: MyLibrary = MyLibrary()
    var currSelectedPlaylist: Playlist = Playlist(title: "", description: "", coverImage: "", songs: [])
    var currPlayingSong: Song = Song(songTitle: "", artist: "", albumCover: "", songLength: "", audioFileName: "")
    
    // MARK: Concerts
    var myConcerts: MyConcerts = MyConcerts()
    var currSelectedConcert: Concert = Concert(artist: "", songs: [], imageThumbnail: "", imageHeader: "")
    var currPlayingVideo: ConcertSong = ConcertSong(songName: "", videoName: "", concertImage: "")
    
    // MARK: Productions
    var myProductions: MyProductions = MyProductions()
    var currSelectedProduction: Production = Production(songName: "", albumCover: "", filesName: "")
}

enum MusicNavigation {
    case library
    case concerts
}
