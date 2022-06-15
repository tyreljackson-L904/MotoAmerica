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
            MainView(rider: RiderList.riders.first!, race: RaceList.classes.first!)
        }
    }
}
