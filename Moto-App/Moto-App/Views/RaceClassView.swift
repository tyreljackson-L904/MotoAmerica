//
//  RaceClassView.swift
//  Moto-App
//
//  Created by Tyrel Jackson on 6/11/22.
//

import SwiftUI

struct RaceClassView: View {
    
    @State private var overText = false
    var raceClass: [RaceClass] = RaceList.classes
    var rider: Rider
    
    var body: some View {
        NavigationView{
            List(raceClass, id: \.id) { race in
                RaceClassCell(raceClass: race, rider: rider)
                    .listRowInsets(EdgeInsets())
                    .listRowBackground(Color.clear)
                    .padding()
            }
            .navigationTitle("Races")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct RaceClassCell: View {
    
    var raceClass: RaceClass
    var rider: Rider
    
    var body: some View {
        NavigationLink(destination: RiderListView(race: raceClass), label: {
            HStack{
                Image(raceClass.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100,height: 70)
                
                Spacer()
                
                Text("\(raceClass.name)")
                    .font(.headline)
                    .lineLimit(2)
                    .minimumScaleFactor(0.5)
            }
            
        })
        
    }
}

struct RaceClassView_Previews: PreviewProvider {
    static var previews: some View {
        RaceClassView(rider: RiderList.riders.first!)
    }
}
