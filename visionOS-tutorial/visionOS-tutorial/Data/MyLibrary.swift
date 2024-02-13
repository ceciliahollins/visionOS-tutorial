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
        let one = Song(songTitle: "Dreams", artist: "Fleetwood Mac", albumCover: "fleetwoodMac", songLength: "4:18", audioFileName: "FleetwoodMac_Dreams")
        let two = Song(songTitle: "One of These Nights", artist: "Eagles", albumCover: "eagles", songLength: "4:52", audioFileName: "Eagles_OneOfTheseNights")
        let three = Song(songTitle: "Bennie and The Jets", artist: "Elton John", albumCover: "eltonJohn", songLength: "5:23", audioFileName: "EltonJohn_BennieAndTheJets")
        let four = Song(songTitle: "Dancing in the Moonlight", artist: "Toploader", albumCover: "toploader", songLength: "3:52", audioFileName: "Toploader_DancingInTheMoonlight")
        let five = Song(songTitle: "Vienna", artist: "Billy Joel", albumCover: "billyJoel", songLength: "3:34", audioFileName: "BillyJoel_Vienna")
        
        return Playlist(title: "Seventies Hits",
                        description: "The best of what the 70s had to offer",
                        coverImage: "seventiesCover",
                        songs: [one, two, three, four, five])
    }
    
    static func createSurfRockPlaylist() -> Playlist {
        let one = Song(songTitle: "Booster Seat", artist: "Spacey Jane", albumCover: "spaceyJane", songLength: "4:29", audioFileName: "SpaceyJane_BoosterSeat")
        let two = Song(songTitle: "Goodie Bag", artist: "Still Woozy", albumCover: "stillWoozy", songLength: "2:26", audioFileName: "StillWoozy_GoodieBag")
        let three = Song(songTitle: "Gold Snafu", artist: "Sticky Fingers", albumCover: "stickyFingers", songLength: "3:38", audioFileName: "StickyFingers_GoldSnafu")
        let four = Song(songTitle: "Be About You", artist: "Winston Surfshirt", albumCover: "winstonSurfshirt", songLength: "4:09", audioFileName: "WinstonSurfshirt_BeAboutYou")
        let five = Song(songTitle: "Confidence", artist: "Ocean Alley", albumCover: "oceanAlley", songLength: "4:13", audioFileName: "OceanAlley_Confidence")
        
        return Playlist(title: "Australian Surf Rock",
                        description: "Driving down the coast blasting this playlist",
                        coverImage: "surfRockCover",
                        songs: [one, two, three, four, five])
    }
    
    static func createIndieRockPlaylist() -> Playlist {
        let one = Song(songTitle: "Do I Wanna Know?", artist: "Arctic Monkeys", albumCover: "arcticMonkeys", songLength: "4:32", audioFileName: "ArcticMonkeys_DoIWannaKnow")
        let two = Song(songTitle: "Take Me Out", artist: "Franz Ferdinand", albumCover: "franzFerdinand", songLength: "3:57", audioFileName: "FranzFerdinand_TakeMeOut")
        let three = Song(songTitle: "Are You Gonna Be My Girl", artist: "Jet", albumCover: "jet", songLength: "3:34", audioFileName: "Jet_AreYouGonnaBeMyGirl")
        let four = Song(songTitle: "Last Nite", artist: "The Strokes", albumCover: "theStrokes", songLength: "3:14", audioFileName: "TheStrokes_LastNite")
        let five = Song(songTitle: "Naive", artist: "The Kooks", albumCover: "theKooks", songLength: "3:24", audioFileName: "TheKooks_Naive")
        
        return Playlist(title: "Indie Rock Club",
                        description: "Iconic indie tracks you know and love",
                        coverImage: "indieRockCover",
                        songs: [one, two, three, four, five])
    }
    
    static func createSoftPopPlaylist() -> Playlist {
        let one = Song(songTitle: "Banana Pancakes", artist: "Jack Johnson", albumCover: "jackJohnson", songLength: "3:12", audioFileName: "JackJohnson_BananaPancakes")
        let two = Song(songTitle: "Gravity", artist: "John Mayer", albumCover: "johnMayer", songLength: "4:06", audioFileName: "JohnMayer_Gravity")
        let three = Song(songTitle: "Sunday Morning", artist: "Maroon 5", albumCover: "maroon5", songLength: "4:05", audioFileName: "Maroon5_SundayMorning")
        let four = Song(songTitle: "I'm Yours", artist: "Jason Mraz", albumCover: "jasonMraz", songLength: "4:03", audioFileName: "JasonMraz_ImYours")
        let five = Song(songTitle: "Put Your Records On", artist: "Corinne Bailey Rae", albumCover: "corinneBaileyRae", songLength: "3:35", audioFileName: "CorinneBaileyRae_PutYourRecordsOn")
        
        return Playlist(title: "Lazy Sunday",
                        description: "Because a quiet Sunday never hurt anybody",
                        coverImage: "softPopCover",
                        songs: [one, two, three, four, five])
    }
    
    static func createSoulFunkPlaylist() -> Playlist {
        let one = Song(songTitle: "Heart Don't Stand A Chance", artist: "Anderson .Paak", albumCover: "andersonPaak", songLength: "5:12", audioFileName: "AndersonPaak_HeartDontStandAChance")
        let two = Song(songTitle: "Back On 74", artist: "Jungle", albumCover: "jungle", songLength: "3:29", audioFileName: "Jungle_BackOn74")
        let three = Song(songTitle: "Out Of Love", artist: "Busty and the Bass", albumCover: "bustyAndTheBass", songLength: "4:50", audioFileName: "BustyAndTheBass_OutOfLove")
        let four = Song(songTitle: "Blue World", artist: "Mac Miller", albumCover: "macMiller", songLength: "3:29", audioFileName: "MacMiller_BlueWorld")
        let five = Song(songTitle: "Redbone", artist: "Childish Gambino", albumCover: "childishGambino", songLength: "5:27", audioFileName: "ChildishGambino_Redbone")
        
        return Playlist(title: "Funk and Soul",
                        description: "A selection of the greatest modern funk and soul records",
                        coverImage: "soulFunkCover",
                        songs: [one, two, three, four, five])
    }
}
