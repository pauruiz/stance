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

struct GymSet: Decodable, Hashable {
    static func == (lhs: GymSet, rhs: GymSet) -> Bool {
        // TODO -- Confirm that we don't need to compare the arrays
        return lhs.reps == rhs.reps && lhs.timestamp == rhs.timestamp
    }
    
    var reps: [GymRep]
    var timestamp: Date
}

struct GymRep: Decodable, Hashable {
    var intensity: Float
    var speed: Float
    var timestamp: Date
}
