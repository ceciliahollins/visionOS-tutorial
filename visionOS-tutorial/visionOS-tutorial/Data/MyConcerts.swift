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
        concerts.append(MyConcerts.createEltonJohnConcert())
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
    
    static func createEltonJohnConcert() -> Concert {
        let one = ConcertSong(songName: "Bennie and the Jets", videoName: "EltonJohn_BennieAndTheJets", concertImage: "eltonJohnConcert1")
        let two = ConcertSong(songName: "Rocket Man", videoName: "EltonJohn_RocketMan", concertImage: "eltonJohnConcert2")
        let three = ConcertSong(songName: "Crocodile Rock", videoName: "EltonJohn_CrocodileRock", concertImage: "eltonJohnConcert3")
        
        return Concert(artist: "Elton John",
                       songs: [one, two, three],
                       imageThumbnail: "eltonJohn",
                       imageHeader: "eltonJohnHeader")
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
