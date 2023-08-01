//
//  MyLibrary.swift
//  VisionProFirstProject
//
//  Created by Hollins, Cecilia on 28/6/2023.
//

import SwiftUI

struct MyLibrary {
    
    var library: [Playlist] = []
    
    init() {
        library.append(MyLibrary.createSeventiesPlaylist())
        library.append(MyLibrary.createSurfRockPlaylist())
        library.append(MyLibrary.createIndieRockPlaylist())
        library.append(MyLibrary.createSoftPopPlaylist())
        library.append(MyLibrary.createSoulFunkPlaylist())
    }
    
    static func createSeventiesPlaylist() -> Playlist {
        let one = Song(songTitle: "Dreams", artist: "Fleetwood Mac", albumCover: "fleetwoodMac", songLength: "4:18")
        let two = Song(songTitle: "One of These Nights", artist: "Eagles", albumCover: "eagles", songLength: "4:52")
        let three = Song(songTitle: "Bennie and The Jets", artist: "Elton John", albumCover: "eltonJohn", songLength: "5:23")
        let four = Song(songTitle: "Dancing in the Moonlight", artist: "Toploader", albumCover: "toploader", songLength: "3:52")
        let five = Song(songTitle: "Vienna", artist: "Billy Joel", albumCover: "billyJoel", songLength: "3:34")
        
        return Playlist(title: "Seventies Hits",
                        description: "The best of what the 70s had to offer",
                        coverImage: "seventiesCover",
                        songs: [one, two, three, four, five])
    }
    
    static func createSurfRockPlaylist() -> Playlist {
        let one = Song(songTitle: "Booster Seat", artist: "Spacey Jane", albumCover: "spaceyJane", songLength: "4:29")
        let two = Song(songTitle: "Goodie Bag", artist: "Still Woozy", albumCover: "stillWoozy", songLength: "2:26")
        let three = Song(songTitle: "Gold Snafu", artist: "Sticky Fingers", albumCover: "stickyFingers", songLength: "3:38")
        let four = Song(songTitle: "Be About You", artist: "Winston Surfshirt", albumCover: "winstonSurfshirt", songLength: "4:09")
        let five = Song(songTitle: "Confidence", artist: "Ocean Alley", albumCover: "oceanAlley", songLength: "4:13")
        
        return Playlist(title: "Australian Surf Rock",
                        description: "Driving down the coast blasting this playlist",
                        coverImage: "surfRockCover",
                        songs: [one, two, three, four, five])
    }
    
    static func createIndieRockPlaylist() -> Playlist {
        let one = Song(songTitle: "Do I Wanna Know?", artist: "Arctic Monkeys", albumCover: "arcticMonkeys", songLength: "4:32")
        let two = Song(songTitle: "Take Me Out", artist: "Franz Ferdinand", albumCover: "franzFerdinand", songLength: "3:57")
        let three = Song(songTitle: "Are You Gonna Be My Girl", artist: "Jet", albumCover: "jet", songLength: "3:34")
        let four = Song(songTitle: "Last Nite", artist: "The Strokes", albumCover: "theStrokes", songLength: "3:14")
        let five = Song(songTitle: "Naive", artist: "The Kooks", albumCover: "theKooks", songLength: "3:24")
        
        return Playlist(title: "Indie Rock Club",
                        description: "Iconic indie tracks you know and love",
                        coverImage: "indieRockCover",
                        songs: [one, two, three, four, five])
    }
    
    static func createSoftPopPlaylist() -> Playlist {
        let one = Song(songTitle: "Banana Pancakes", artist: "Jack Johnson", albumCover: "jackJohnson", songLength: "3:12")
        let two = Song(songTitle: "Gravity", artist: "John Mayer", albumCover: "johnMayer", songLength: "4:06")
        let three = Song(songTitle: "Sunday Morning", artist: "Maroon 5", albumCover: "maroon5", songLength: "4:05")
        let four = Song(songTitle: "I'm Yours", artist: "Jason Mraz", albumCover: "jasonMraz", songLength: "4:03")
        let five = Song(songTitle: "Put Your Records On", artist: "Corinne Bailey Rae", albumCover: "corinneBaileyRae", songLength: "3:35")
        
        return Playlist(title: "Lazy Sunday",
                        description: "Because a quiet Sunday never hurt anybody",
                        coverImage: "softPopCover",
                        songs: [one, two, three, four, five])
    }
    
    static func createSoulFunkPlaylist() -> Playlist {
        let one = Song(songTitle: "'Til It's Over", artist: "Anderson .Paak", albumCover: "andersonPaak", songLength: "3:22")
        let two = Song(songTitle: "Redbone", artist: "Childish Gambino", albumCover: "childishGambino", songLength: "5:27")
        let three = Song(songTitle: "Blue World", artist: "Mac Miller", albumCover: "macMiller", songLength: "3:29")
        let four = Song(songTitle: "Them Changes", artist: "Thundercat", albumCover: "thundercat", songLength: "3:08")
        let five = Song(songTitle: "Thin Lines", artist: "PawPaw Rod", albumCover: "pawPawRod", songLength: "2:51")
        
        return Playlist(title: "Modern Funk and Soul",
                        description: "A selection of the greatest modern funk and soul records",
                        coverImage: "soulFunkCover",
                        songs: [one, two, three, four, five])
    }
}
