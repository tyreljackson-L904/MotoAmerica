//
//  Moto_AppApp.swift
//  Moto-App
//
//  Created by Tyrel Jackson on 6/10/22.
//

import SwiftUI

@main
struct Moto_AppApp: App {
    
    var body: some Scene {
        WindowGroup {
            RiderListView(race: RaceList.classes.first!)
//            RaceClassView(rider: RiderList.riders.first!)
        }
    }
}
