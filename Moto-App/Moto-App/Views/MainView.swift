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
        NavigationView {
            ZStack {
                GeometryReader { geo in
//                    PlayerView()
//                        .frame(maxWidth: .infinity, maxHeight: .infinity)
//                        .scaledToFill()
//                        .clipped()
//                        .ignoresSafeArea()
                    
                    FloatingMenu(rider: rider)
                }
            }
            .navigationBarHidden(true)
        }
        
    }
}

struct TextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .foregroundColor(Color.white)
            .frame(width: 280, height: 70)
            .background(Color.ui.lightRed)
            .cornerRadius(8)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(rider: RiderList.riders.first!, race: RaceList.classes.first!)
            .previewInterfaceOrientation(.portrait)
        
        MainView(rider: RiderList.riders.first!, race: RaceList.classes.first!)
            .previewInterfaceOrientation(.landscapeRight)
    }
}
