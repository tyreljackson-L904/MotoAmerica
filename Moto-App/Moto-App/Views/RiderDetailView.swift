//
//  RiderDetailView.swift
//  Moto-App
//
//  Created by Tyrel Jackson on 6/12/22.
//

import SwiftUI

struct RiderDetailView: View {
    
    @State private var tabSelection = 1
    var rider: Rider
    
    var body: some View {
        VStack(spacing: 0) {
            
            Image("\(rider.riderImage)")
                .resizable()
                .scaledToFit()
            
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 15)
                .foregroundColor(Color.ui.lightRed)
            
            Picker("Select" ,selection: $tabSelection) {
                Text("Bio").tag(1)
                Text("Stats").tag(2)
                Text("Timing & Scoring").tag(3)
            }
            .pickerStyle(SegmentedPickerStyle())
            .foregroundColor(.white)
            
            Spacer()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
}

struct RiderDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RiderDetailView(rider: RiderList.riders[3])
    }
}
