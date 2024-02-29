//
//  Production.swift
//  visionOS-tutorial
//
//  Created by Hollins, Cecilia on 25/2/2024.
//

import Foundation
import SwiftUI

struct Production: Identifiable, Hashable {
    let id = UUID()
    let songName: String
    let albumCover: String
    let filesName: String
}
