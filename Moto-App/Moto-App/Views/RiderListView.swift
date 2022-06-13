//
//  RiderListView.swift
//  Moto-App
//
//  Created by Tyrel Jackson on 6/10/22.
//

import SwiftUI

struct RiderListView: View {
    
    var riders: [Rider] = RiderList.riders
    var race: RaceClass
    
    var body: some View {
        VStack {
            List(riders, id: \.id) { rider in
                NavigationLink(destination: RiderDetailView(rider: rider), label: {
                    HStack(spacing: 20) {
                        RiderCell(rider: rider)
                    }
                })
                .listRowInsets(EdgeInsets())
                .listRowBackground(Color.clear)
                .padding(.vertical, 14)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .navigationTitle("\(race.name)")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct RiderCell: View {
    
    var rider: Rider
    var body: some View {
        ZStack {
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 8)
                    .fill(
                        LinearGradient(gradient: Gradient(stops: [
                            .init(color: Color.ui.lightRed, location: 0.10),
                            .init(color: Color.ui.grayBlue, location: 0.10),
                        ]), startPoint: .leading, endPoint: .trailing)
                    )
                    .frame(width: 110, height: 80)
            }
            
            Image(rider.riderImage)
                .resizable()
                .scaledToFit()
                .frame(height: 60)
                .cornerRadius(4)
        }
        
        VStack(alignment: .leading, spacing: 5) {
            Text(rider.name)
                .font(.headline)
                .fontWeight(.semibold)
            
            Label("\(rider.nationality)", systemImage: "flag")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Text("MEDALLIA SUPERBIKE")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
        }
        
    }
}


struct RiderListView_Previews: PreviewProvider {
    static var previews: some View {
        RiderListView(race: RaceList.classes.first!)
    }
}
