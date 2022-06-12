//
//  ContentView.swift
//  Moto-App
//
//  Created by Tyrel Jackson on 6/12/22.
//

import SwiftUI

struct ContentView: View {
    @State private var tabSelection = 1
    var rider: Rider
    
    var body: some View {
            TabView {
                HomeView(rider: rider)
                    .tabItem {
                        Image(systemName: "house.fill")
                    }
                Text("Search")
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                    }
            }
//            .navigationTitle("MotoAmerica")
//            .navigationBarTitleDisplayMode(.inline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(rider: RiderList.riders.first!)
    }
}
