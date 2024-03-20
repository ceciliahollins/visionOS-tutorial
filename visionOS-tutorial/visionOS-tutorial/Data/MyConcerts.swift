//
//  Concerts.swift
//  visionOS-tutorial
//
//  Created by Hollins, Cecilia on 15/1/2024.
//

import Foundation
import SwiftUI

struct MyConcerts {
    
    var concerts: [Concert] = []
    
    init() {
        concerts.append(MyConcerts.createGlassAnimalsConcert())
        concerts.append(MyConcerts.createEasyLifeConcert())
        concerts.append(MyConcerts.createAndersonPaakConcert())
        concerts.append(MyConcerts.createTheInternetConcert())
        concerts.append(MyConcerts.createOceanAlleyConcert())
    }
    
    static func createGlassAnimalsConcert() -> Concert {
        let one = ConcertSong(songName: "Gooey", videoName: "GlassAnimals_Gooey", concertImage: "glassAnimalsConcert1")
        let two = ConcertSong(songName: "The Other Side Of Paradise", videoName: "GlassAnimals_TheOtherSideOfParadise", concertImage: "glassAnimalsConcert2")
        let three = ConcertSong(songName: "Heat Waves", videoName: "GlassAnimals_HeatWaves", concertImage: "glassAnimalsConcert3")
        
        return Concert(artist: "Glass Animals",
                       songs: [one, two, three],
                       imageThumbnail: "glassAnimals",
                       imageHeader: "glassAnimalsHeader")
    }
    
    static func createEasyLifeConcert() -> Concert {
        let one = ConcertSong(songName: "Sangria", videoName: "EasyLife_Sangria", concertImage: "easyLifeConcert1")
        let two = ConcertSong(songName: "Peanut Butter", videoName: "EasyLife_PeanutButter", concertImage: "easyLifeConcert2")
        let three = ConcertSong(songName: "Petty Crimes", videoName: "EasyLife_PettyCrimes", concertImage: "easyLifeConcert3")
        
        return Concert(artist: "Easy Life",
                       songs: [one, two, three],
                       imageThumbnail: "easyLife",
                       imageHeader: "easyLifeHeader")
    }
    
    static func createAndersonPaakConcert() -> Concert {
        let one = ConcertSong(songName: "Am I Wrong", videoName: "AndersonPaak_AmIWrong", concertImage: "andersonPaakConcert1")
        let two = ConcertSong(songName: "The Bird", videoName: "AndersonPaak_TheBird", concertImage: "andersonPaakConcert2")
        let three = ConcertSong(songName: "Come Down", videoName: "AndersonPaak_ComeDown", concertImage: "andersonPaakConcert3")
        
        return Concert(artist: "Anderson Paak",
                       songs: [one, two, three],
                       imageThumbnail: "andersonPaak",
                       imageHeader: "andersonPaakHeader")
    }
    
    static func createTheInternetConcert() -> Concert {
        let one = ConcertSong(songName: "Dark Red (1)", videoName: "SteveLacy_DarkRed", concertImage: "theInternetConcert1")
        let two = ConcertSong(songName: "Dark Red (2)", videoName: "SteveLacy_DarkRed_2", concertImage: "theInternetConcert2")
        let three = ConcertSong(songName: "Girl", videoName: "TheInternet_Girl", concertImage: "theInternetConcert3")
        
        return Concert(artist: "The Internet",
                       songs: [one, two, three],
                       imageThumbnail: "theInternet",
                       imageHeader: "theInternetHeader")
    }
    
    static func createOceanAlleyConcert() -> Concert {
        let one = ConcertSong(songName: "Confidence", videoName: "OceanAlley_Confidence", concertImage: "oceanAlleyConcert1")
        let two = ConcertSong(songName: "Baby Come Back", videoName: "OceanAlley_BabyComeBack", concertImage: "oceanAlleyConcert2")
        let three = ConcertSong(songName: "Knees", videoName: "OceanAlley_Knees", concertImage: "oceanAlleyConcert3")
        
        return Concert(artist: "Ocean Alley",
                       songs: [one, two, three],
                       imageThumbnail: "oceanAlley",
                       imageHeader: "oceanAlleyHeader")
    }
}
