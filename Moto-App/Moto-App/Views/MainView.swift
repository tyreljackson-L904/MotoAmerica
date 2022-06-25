//
//  MainView.swift
//  Moto-App
//
//  Created by Tyrel Jackson on 6/14/22.
//

import SwiftUI
import AVFoundation

struct MainView: View {
    
    // video view properties
    @State private var player = AVQueuePlayer()
    
    // content view properties
    @State var isLoading = true
    @State var selection = ""
    var rider: Rider
    var race: RaceClass
    
    var body: some View {
        TabView {
            
            // MARK: Timing/Scoring Tab View
            TimingScoringView(rider: rider)
                .tabItem{
                    Image(systemName: "calendar")
                    Text("Timing & Scoring")
                }
            
            // MARK: Race Class Tab View
            RaceClassView(rider: rider)
                .tabItem{
                    Image(systemName: "person")
                    Text("Race Class")
                }
        }
        .onAppear {
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithDefaultBackground()
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        }
        
        // MARK: PLAYER VIEW
        //        NavigationView {
        //            ZStack {
        //                GeometryReader { geo in
        //                    PlayerView()
        //                        .frame(maxWidth: .infinity, maxHeight: .infinity)
        //                        .scaledToFill()
        //                        .clipped()
        //                        .ignoresSafeArea()
        //
        //                    FloatingMenu(rider: rider)
        //                }
        //            }
        //            .navigationBarHidden(true)
        //        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(rider: RiderList.riders.first!, race: RaceList.classes.first!)
            .previewInterfaceOrientation(.portrait)
//            .preferredColorScheme(.dark)
        
        MainView(rider: RiderList.riders.first!, race: RaceList.classes.first!)
            .previewInterfaceOrientation(.landscapeRight)
    }
}

