//
//  ContentView.swift
//  Moto-App
//
//  Created by Tyrel Jackson on 6/10/22.
//

import SwiftUI

struct ContentView: View {
    
    var riders: [Rider] = RiderList.riders
    
    var body: some View {
        VStack {
            
            Image("MotoAmerica_Logo")
                .resizable()
                .scaledToFit()
                .frame(height: 70)
            
            ClassPicker()
            
            List(riders, id: \.id) { rider in
                HStack {
                    RiderCell(rider: rider)
                }
                .listRowInsets(EdgeInsets())
                .listRowBackground(Color.clear)
                .padding(.vertical, 14)
                
            }
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
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

struct ClassPicker: View {
    
    @State private var selection = "Medallia Superbike"
    let raceClass = ["Medallia Superbike", "Mini Cup 110cc", "Mini Cup 160cc", "Mini Cup 190cc", "Mission King of the Baggers", "Royal Enfield", "STG Junior Cup", "Super Hooligan", "Supersport", "Twins", "YUASA Stock 1000"]
    
    var body: some View {
        HStack {
            
            Text("Select: ")
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            Menu {
                Picker(selection: $selection) {
                    ForEach(raceClass, id: \.self) {
                        Text($0)
                    }
                } label: {
                    Text("Class")
                }
            } label: {
                Text("\(selection)")
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
