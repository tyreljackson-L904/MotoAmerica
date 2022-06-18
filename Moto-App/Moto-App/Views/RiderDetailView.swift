//
//  RiderDetailView.swift
//  Moto-App
//
//  Created by Tyrel Jackson on 6/12/22.
//

import SwiftUI

struct RiderDetailView: View {
    
    @State var tabSelection = 1
    var rider: Rider
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack{
                    PickerImageView(tabSelection: $tabSelection, rider: rider)
                    
                    Spacer()
                    
                    TabbedContentView(tabSelection: $tabSelection, rider: rider)
                }
            }
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}



// MARK: Picker & Rider Image View
struct PickerImageView: View {
    
    @Binding var tabSelection: Int
    var rider: Rider
    
    var body: some View {
        VStack(spacing: 0) {
            // Picker to tab content
            Picker("Select" ,selection: $tabSelection) {
                Text("Bio").tag(1)
                Text("Stats").tag(2)
                Text("Timing & Scoring").tag(3)
            }
            .pickerStyle(SegmentedPickerStyle())
            
            Image("\(rider.riderImage)")
                .resizable()
                .scaledToFit()
                .cornerRadius(12)
            //                .frame(height: 400)
                .padding(.top)
            
            Spacer()
        }
        .padding(.top, 20)
    }
}

// MARK: Tab Content View
struct TabbedContentView: View {
    @Binding var tabSelection: Int
    var rider: Rider
    
    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 0) {
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 5)
                    .foregroundColor(Color.ui.lightRed)
                
                if tabSelection == 1 {
                    RiderBioTab(rider: rider)
                } else if tabSelection == 2 {
                    RiderStatsTab(rider: rider)
                } else {
                    TimingScoringTab(rider: rider)
                }
                
                Spacer()
            }
            .frame(width: geo.size.width, height: geo.size.height, alignment: .bottom)
        }
    }
}

// MARK: Tabs
struct RiderBioTab: View {
    
    var rider: Rider
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            HStack {
                VStack(alignment: .leading, spacing: 10){
                    RiderDataRow(rider: rider, label: "Name: ", data: rider.name)
                    RiderDataRow(rider: rider, label: "Date of Birth: ", data: rider.dob)
                    RiderDataRow(rider: rider, label: "Hometown: ", data: rider.hometown)
                    RiderDataRow(rider: rider, label: "Height: ", data:     rider.height)
                    RiderDataRow(rider: rider, label: "Weight: ", data: String(rider.weight))
                    RiderDataRow(rider: rider, label: "Team: ", data: rider.team)
                    RiderDataRow(rider: rider, label: "Bike: ", data: rider.bike)
                    RiderDataRow(rider: rider, label: "Sponsors: ", data: rider.sponsors.joined(separator: ", "))
                }
                .padding()
                
                Spacer()
            }
        }
    }
}

struct RiderStatsTab: View {
    
    @Environment(\.openURL) var openURL
    
    var rider: Rider
    var body: some View {
        GeometryReader { geo in
            VStack(alignment: .center ,spacing: 20) {
                Text("\(rider.name)")
                    .bold()
                    .font(.title3)
                    .padding(.top, 5)
                
                HStack(spacing: 40) {
                    Text("Wins: 12")
                        .fontWeight(.semibold)
                    Text("Podiums: 21")
                        .fontWeight(.semibold)
                }
                .font(.title3)
                
                
                Link( destination: URL(string:"https://www.motoamericaliveplus.com/viewplans")!) {
                    Text("Watch Highlights")
                        .bold()
                        .font(.title3)
                        .frame(width: 250, height: 50)
                        .background(Color.ui.lightRed)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                     
                }
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
    }
}

struct TimingScoringTab: View {
    
    var rider: Rider
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                Text("Timing and Scoring")
            }
            .frame(width: geo.size.width, height: geo.size.height, alignment: .topLeading)
            .padding()
        }
    }
}


// Preview
struct RiderDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RiderDetailView(rider: RiderList.riders[0])
            .previewInterfaceOrientation(.landscapeLeft)
    }
}

// Rider data row for Bio
struct RiderDataRow: View {
    
    var rider: Rider
    var label: String
    var data: String
    
    var body: some View {
        HStack {
            Text(label)
                .font(.headline)
                .fontWeight(.semibold)
            + Text(data)
        }
    }
}
