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
        NavigationView {
            List(raceClass, id: \.id) { race in
                NavigationLink(destination: RiderListView(race: race), label: {
                    RaceClassCell(raceClass: race)
                })
                .listRowInsets(EdgeInsets())
                .listRowBackground(Color.clear)
                .padding()
            }
            .navigationTitle("Race Class")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear{ UITableView.appearance().showsVerticalScrollIndicator = false
            }
        }
    }
}

struct RaceClassView_Previews: PreviewProvider {
    static var previews: some View {
        RaceClassView(rider: RiderList.riders.first!)
        RaceClassView(rider: RiderList.riders.first!)
            .preferredColorScheme(.dark)
    }
}
