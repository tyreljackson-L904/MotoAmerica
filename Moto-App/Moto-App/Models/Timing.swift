//
//  Timing.swift
//  Moto-App
//
//  Created by Tyrel Jackson on 6/16/22.
//

import SwiftUI

struct TimingDataModel: Identifiable, Hashable {
    let id = UUID()
    
    let position: Int
    let num: Int
    let name: String
    let make: String
    let bestLap: String
}

struct RaceDataModel: Identifiable {
    let id = UUID()
    
    let elapsed: Double
    let lapsToGo: Int
    let time: Double
}

