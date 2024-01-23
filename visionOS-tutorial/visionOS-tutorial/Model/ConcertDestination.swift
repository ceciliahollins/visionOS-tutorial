//
//  ConcertDestination.swift
//  visionOS-tutorial
//
//  Created by Hollins, Cecilia on 17/1/2024.
//

import Foundation

enum ConcertDestination: String, CaseIterable, Identifiable, Codable {
    
    case glassAnimals
    
    var id: Self { self }
    
}
