//
//  Concert.swift
//  visionOS-tutorial
//
//  Created by Hollins, Cecilia on 15/1/2024.
//

import Foundation

struct Concert: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let videoName: String
}
