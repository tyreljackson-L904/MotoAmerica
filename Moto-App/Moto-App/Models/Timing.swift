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

struct RiderTiming {
    static let riderTiming = [
        TimingDataModel(position: 1, num: 62, name: "Andy Birino", make: "KAW", bestLap: "12.30"),
        TimingDataModel(position: 2, num: 22, name: "Ashton Yates", make: "BMW", bestLap: "8.40"),
        TimingDataModel(position: 3, num: 96, name: "Brandon Paasch", make: "SUZ", bestLap: "9.20"),
        TimingDataModel(position: 4, num: 45, name: "Cameron Peterson", make: "YAM", bestLap: "7.32"),
        TimingDataModel(position: 5, num: 23, name: "Corey Alexander", make: "BMW", bestLap: "11.21"),
        TimingDataModel(position: 6, num: 40, name: "Dallas Sherman Jr", make: "YAM", bestLap: "10.81"),
        TimingDataModel(position: 7, num: 94, name: "Danilo Lewis", make: "BMW", bestLap: "10.73"),
        TimingDataModel(position: 8, num: 9, name: "Danilo Petrucci", make: "DUC", bestLap: "9.87"),
        TimingDataModel(position: 9, num: 25, name: "David Anthony", make: "SUZ", bestLap: "12.11"),
        TimingDataModel(position: 10, num: 28, name: "David Lambert", make: "KAW", bestLap: "11.11")
    ]
}
struct RaceDataModel: Identifiable {
    let id = UUID()
    
    let elapsed: Double
    let lapsToGo: Int
    let time: Double
}

