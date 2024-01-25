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
}
