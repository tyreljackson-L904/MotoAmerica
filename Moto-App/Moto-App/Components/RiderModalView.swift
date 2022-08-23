//
//  RiderQuickView.swift
//  Moto-App
//
//  Created by Tyrel Jackson on 6/24/22.
//

import SwiftUI

struct RiderModalView: View {
    
    @Environment(\.presentationMode) var mode
    var rider: Rider
    
    var body: some View {
        
            VStack(spacing: 15) {
                
                Image(rider.riderImage)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                    .frame(maxWidth: .infinity)
                    .frame(height: 200)
                
                HStack(spacing: 30) {
                    Text(rider.name)
                        .font(.headline)
                    Text("#\(rider.bikeNumber)")
                        .font(.headline)
                        .foregroundColor(.black.opacity(0.7))
                }
                
                Text("Team: \(rider.team)")
                    .font(.subheadline)
                
                Text("Bike: \(rider.bike)")
                    .font(.subheadline)
                
                NavigationLink {
                    RiderDetailView(rider: rider)
                } label: {
                    Text("View Bio")
                        .font(.title3)
                        .bold()
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color.ui.lightRed)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                
                Button {
                    mode.wrappedValue.dismiss()
                } label: {
                    Text("Close")
                        .font(.headline)
                        .foregroundColor(Color.ui.grayBlue)
                }

            }
        
    }
}

struct RiderModalView_Previews: PreviewProvider {
    static var previews: some View {
        RiderModalView(rider: RiderList.riders.first!)
    }
}
