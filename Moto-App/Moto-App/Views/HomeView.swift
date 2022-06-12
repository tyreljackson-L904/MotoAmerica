//
//  HomeView.swift
//  Moto-App
//
//  Created by Tyrel Jackson on 6/12/22.
//

import SwiftUI

struct HomeView: View {
    var rider: Rider
    var body: some View {
        NavigationView {
            VStack {
                Text("Home")
            }
            .navigationTitle("")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(rider: RiderList.riders.first!)
    }
}
