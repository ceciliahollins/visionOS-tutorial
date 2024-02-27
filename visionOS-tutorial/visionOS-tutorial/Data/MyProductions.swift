//
//  MyProductions.swift
//  visionOS-tutorial
//
//  Created by Hollins, Cecilia on 25/2/2024.
//

import Foundation

struct MyProductions {
    
    var produtions: [Production] = []
    
    init() {
        produtions.append(MyProductions.createJungleProduction())
        produtions.append(MyProductions.createBustyProduction())
        produtions.append(MyProductions.createMacMillerProduction())
    }
    
    static func createJungleProduction() -> Production {
        return Production(songName: "Back on 74 Street", 
                          albumCover: "jungle",
                          filesName: "Jungle_BackOn74")
    }
    
    static func createBustyProduction() -> Production {
        return Production(songName: "Out Of Love",
                          albumCover: "bustyAndTheBass",
                          filesName: "BustyAndTheBass_OutOfLove")
    }
    
    static func createMacMillerProduction() -> Production {
        return Production(songName: "Blue World",
                          albumCover: "macMiller",
                          filesName: "MacMiller_BlueWorld")
    }
}
