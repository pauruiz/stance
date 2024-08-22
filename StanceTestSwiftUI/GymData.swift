//
//  GymData.swift
//  StanceTestSwiftUI
//
//  Created by Pau Ruiz Perez on 22/08/2024.
//

import Foundation

protocol AnyGymData {
    var sets: [GymSet] {get set}
}

struct GymData: Decodable, AnyGymData{
    var sets: [GymSet]
}

struct GymSet: Decodable {
    var reps: [Rep]
    var timestamp: Date
}

struct Rep: Decodable {
    var intensity: Float
    var speed: Float
    var timestamp: Date
}
