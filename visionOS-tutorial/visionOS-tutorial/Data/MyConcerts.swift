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
        let one = ConcertSong(songName: "Gooey", videoName: "GlassAnimals_Gooey", thumbnailColor: Color(red: 0.72, green: 0.83, blue: 0.87))
        let two = ConcertSong(songName: "The Other Side Of Paradise", videoName: "GlassAnimals_TheOtherSideOfParadise", thumbnailColor: Color(red: 0.86, green: 0.39, blue: 0.21))
        let three = ConcertSong(songName: "Heat Waves", videoName: "GlassAnimals_HeatWaves", thumbnailColor: Color(red: 0.40, green: 0.14, blue: 0.00))
        
        return Concert(artist: "Glass Animals",
                       songs: [one, two, three],
                       imageThumbnail: "glassAnimals",
                       imageHeader: "glassAnimalsHeader")
    }
    
    static func createEasyLifeConcert() -> Concert {
        let one = ConcertSong(songName: "Sangria", videoName: "EasyLife_Sangria", thumbnailColor: Color(red: 0.80, green: 0.49, blue: 0.34))
        let two = ConcertSong(songName: "Peanut Butter", videoName: "EasyLife_PeanutButter", thumbnailColor: Color(red: 0.82, green: 0.59, blue: 0.60))
        let three = ConcertSong(songName: "Petty Crimes", videoName: "EasyLife_PettyCrimes", thumbnailColor: Color(red: 0.66, green: 0.83, blue: 0.82))
        
        return Concert(artist: "Easy Life",
                       songs: [one, two, three],
                       imageThumbnail: "easyLife",
                       imageHeader: "easyLifeHeader")
    }
    
    static func createEltonJohnConcert() -> Concert {
        let one = ConcertSong(songName: "Bennie and the Jets", videoName: "EltonJohn_BennieAndTheJets", thumbnailColor: Color(red: 0.17, green: 0.18, blue: 0.23))
        let two = ConcertSong(songName: "Rocket Man", videoName: "EltonJohn_RocketMan", thumbnailColor: Color(red: 0.12, green: 0.27, blue: 0.60))
        let three = ConcertSong(songName: "Crocodile Rock", videoName: "EltonJohn_CrocodileRock", thumbnailColor: Color(red: 0.53, green: 0.22, blue: 0.25))
        
        return Concert(artist: "Elton John",
                       songs: [one, two, three],
                       imageThumbnail: "eltonJohn",
                       imageHeader: "eltonJohnHeader")
    }
    
    static func createOceanAlleyConcert() -> Concert {
        let one = ConcertSong(songName: "Confidence", videoName: "OceanAlley_Confidence", thumbnailColor: Color(red: 0.78, green: 0.82, blue: 0.70))
        let two = ConcertSong(songName: "Baby Come Back", videoName: "OceanAlley_BabyComeBack", thumbnailColor: Color(red: 0.31, green: 0.11, blue: 0.19))
        let three = ConcertSong(songName: "Knees", videoName: "OceanAlley_Knees", thumbnailColor: Color(red: 0.60, green: 0.74, blue: 0.87))
        
        return Concert(artist: "Ocean Alley",
                       songs: [one, two, three],
                       imageThumbnail: "oceanAlley",
                       imageHeader: "oceanAlleyHeader")
    }
}
