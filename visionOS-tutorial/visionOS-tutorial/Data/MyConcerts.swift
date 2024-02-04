//
//  Concerts.swift
//  visionOS-tutorial
//
//  Created by Hollins, Cecilia on 15/1/2024.
//

import Foundation

struct MyConcerts {
    
    var concerts: [Concert] = []
    
    init() {
        concerts.append(MyConcerts.createGlassAnimalsConcert())
        concerts.append(MyConcerts.createEasyLifeConcert())
        concerts.append(MyConcerts.createEltonJohnConcert())
        concerts.append(MyConcerts.createOceanAlleyConcert())
    }
    
    static func createGlassAnimalsConcert() -> Concert {
        let one = ConcertSong(songName: "Gooey", videoName: "GlassAnimals_Gooey")
        let two = ConcertSong(songName: "The Other Side Of Paradise", videoName: "GlassAnimals_TheOtherSideOfParadise")
        let three = ConcertSong(songName: "Heat Waves", videoName: "GlassAnimals_HeatWaves")
        
        return Concert(artist: "Glass Animals",
                       songs: [one, two, three],
                       imageThumbnail: "glassAnimals",
                       imageHeader: "glassAnimalsHeader")
    }
    
    static func createEasyLifeConcert() -> Concert {
        let one = ConcertSong(songName: "Sangria", videoName: "EasyLife_Sangria")
        let two = ConcertSong(songName: "Peanut Butter", videoName: "EasyLife_PeanutButter")
        let three = ConcertSong(songName: "Petty Crimes", videoName: "EasyLife_PettyCrimes")
        
        return Concert(artist: "Easy Life",
                       songs: [one, two, three],
                       imageThumbnail: "easyLife",
                       imageHeader: "easyLifeHeader")
    }
    
    static func createEltonJohnConcert() -> Concert {
        let one = ConcertSong(songName: "Bennie and the Jets", videoName: "EltonJohn_BennieAndTheJets")
        let two = ConcertSong(songName: "Rocket Man", videoName: "EltonJohn_RocketMan")
        let three = ConcertSong(songName: "Crocodile Rock", videoName: "EltonJohn_CrocodileRock")
        
        return Concert(artist: "Elton John",
                       songs: [one, two, three],
                       imageThumbnail: "eltonJohn",
                       imageHeader: "eltonJohnHeader")
    }
    
    static func createOceanAlleyConcert() -> Concert {
        let one = ConcertSong(songName: "Confidence", videoName: "OceanAlley_Confidence")
        let two = ConcertSong(songName: "Baby Come Back", videoName: "OceanAlley_BabyComeBack")
        let three = ConcertSong(songName: "Knees", videoName: "OceanAlley_Knees")
        
        return Concert(artist: "Ocean Alley",
                       songs: [one, two, three],
                       imageThumbnail: "oceanAlley",
                       imageHeader: "oceanAlleyHeader")
    }
}
