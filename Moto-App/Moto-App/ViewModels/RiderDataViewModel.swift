//
//  RiderDataViewModel.swift
//  Moto-App
//
//  Created by Tyrel Jackson on 7/29/22.
//

import Foundation

class RiderViewModel: ObservableObject {
    
    @Published var rider: Rider
    
    init(rider: Rider) {
        self.rider = rider
    }
    
    // get single user
    func fetchRider(forUid uid: String) {
        
    }
    
    // get all users
    func fetchAllRiders() {
        
    }
    
    // get race data
    func fetchRaceData() {
        
    }
    
}
