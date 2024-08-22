//
//  GymDataForTest.swift
//  StanceTestSwiftUI
//
//  Created by Pau Ruiz Perez on 22/08/2024.
//

import Foundation

struct GymDataForTest {
    func getData() -> [GymData] {
        return [
            GymData(sets: [
                GymSet(reps:
                [
                    Rep(intensity: 0.33, speed: 0.38, timestamp: Date(timeIntervalSince1970: 431431244312)),
                    Rep(intensity: 0.33, speed: 0.38, timestamp: Date(timeIntervalSince1970: 431431244320))
                ], timestamp: Date(timeIntervalSince1970: 431431244320))]
            )
        ]
    }
}
