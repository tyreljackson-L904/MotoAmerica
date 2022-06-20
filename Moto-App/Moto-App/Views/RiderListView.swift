//
//  RiderListView.swift
//  Moto-App
//
//  Created by Tyrel Jackson on 6/10/22.
//

import SwiftUI

public struct RiderListView: View {
    
    var riders: [Rider] = RiderList.riders
    var race: RaceClass
    
    public var body: some View {
        
        VStack {
            List(riders, id: \.id) { rider in
                NavigationLink(destination: RiderDetailView(rider: rider), label: {
                    HStack(spacing: 20) {
                        RiderCell(rider: rider)
                    }

                })
                .buttonStyle(PlainButtonStyle())
                .listRowInsets(EdgeInsets())
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
                .padding(.vertical, 14)

                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .navigationTitle("\(race.name)")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct RiderListView_Previews: PreviewProvider {
    static var previews: some View {
        RiderListView(race: RaceList.classes.first!)
        RiderListView(race: RaceList.classes.first!)
            .preferredColorScheme(.dark)
    }
}

public struct RiderCell: View {
    
    @Environment(\.colorScheme) var colorScheme
    var rider: Rider
    
    public var body: some View {
        
        ZStack {
            GeometryReader { geo in
                RoundedRectangle(cornerRadius: 8)
                    .fill(
                        LinearGradient(gradient: Gradient(stops: [
                            .init(color: Color.ui.lightRed, location: 0.10),
                            .init(color: Color.ui.grayBlue, location: 0.10),
                        ]), startPoint: .leading, endPoint: .trailing)
                    )
                    .frame(width: geo.size.width, height: geo.size.height)
            }
            
            HStack(spacing: 30) {
                Image(rider.riderImage)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .cornerRadius(4)
                
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(rider.name)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(colorScheme == .dark ? Color.white : Color.white)
                    
                    Label("\(rider.nationality)", systemImage: "flag")
                        .font(.subheadline)
                        .foregroundColor(colorScheme == .dark ? Color.white.opacity(0.7) : Color.white.opacity(0.7))
                    
                    Text("MEDALLIA SUPERBIKE")
                        .font(.subheadline)
                        .foregroundColor(colorScheme == .dark ? Color.white.opacity(0.7) : Color.white.opacity(0.7))
                    
                }
            }
        }
    }
    
}
