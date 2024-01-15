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
    
    // TODO: update when more concerts are brought into the project
    static func createGlassAnimalsConcert() -> Concert {
        return Concert(title: "",
                       videoName: "glassAnimals_Gooey")
    }
}
