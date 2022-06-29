//
//  RiderDetailView.swift
//  Moto-App
//
//  Created by Tyrel Jackson on 6/12/22.
//

import SwiftUI

struct RiderDetailView: View {
    
    @State var tabSelection = 3
    @State private var orientation = UIDeviceOrientation.unknown
    var rider: Rider
    
    var body: some View {
        NavigationView {
            VStack{
                // Picker to tab content
                Picker("Select" ,selection: $tabSelection) {
                    Text("Bio").tag(1)
                    Text("Stats").tag(2)
                    Text("Timing & Scoring").tag(3)
                }
                .pickerStyle(SegmentedPickerStyle())
                
                RiderImageView(tabSelection: $tabSelection, rider: rider)
                
                TabbedContentView(tabSelection: $tabSelection, rider: rider)
            }
            .frame(maxWidth: .infinity)
            .navigationBarHidden(true)
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}


// MARK: Rider Image View
struct RiderImageView: View {
    
    @Binding var tabSelection: Int
    var rider: Rider
    
    var body: some View {
            
        ZStack {
            Rectangle()
                .fill(
                    LinearGradient(gradient: Gradient(stops: [
                        .init(color: Color.ui.lightRed, location: 0.01),
                        .init(color: Color.ui.grayBlue, location: 0.02),
                        .init(color: Color.white, location: 2.6)
                    ]), startPoint: .leading, endPoint: .trailing)
                )
                .frame(maxWidth: .infinity)
//                .frame(height: 430)
                .padding(.top, 70)
            
            Image("\(rider.riderImage)")
                .resizable()
                .frame(maxWidth: .infinity)
                .scaledToFit()
                .cornerRadius(10)
                .padding(.vertical)
            
            
            LinearGradient(gradient: Gradient(stops: [
                .init(color: .clear, location: 0.5),
                .init(color: .black, location: 0.8)
            ]), startPoint: .top, endPoint: .bottom)
            
            GeometryReader { geo in
                VStack {
                    Spacer()
                    
                    HStack {
                        Text("#\(rider.bikeNumber)")
                            .font(.system(size: 60))
                            .bold()
                            .italic()
                            .foregroundColor(.white.opacity(0.35))
                        
                        Spacer()
                        
                        VStack(alignment: .leading, spacing: 5) {
                            RiderDataRow(rider: rider, label: "", data: rider.name)
                                .foregroundColor(.white)
                            RiderDataRow(rider: rider, label: "Team: ", data: rider.team)
                                .foregroundColor(.white)
                            RiderDataRow(rider: rider, label: "Bike: ", data: rider.bike)
                                .foregroundColor(.white)
                        }
                        
                        Spacer()
                    }.padding()
                }
                .frame(maxWidth: .infinity)
//                .frame(maxHeight: 500)
            }
        }
    }
}

// MARK: Tab Content View
struct TabbedContentView: View {
    @Binding var tabSelection: Int
    var rider: Rider
    
    var body: some View {
        
            VStack(spacing: 0) {
                
                if tabSelection == 1 {
                    RiderBioTab(rider: rider)
                } else if tabSelection == 2 {
                    RiderStatsTab(rider: rider)
                } else {
                    TimingScoringTab(rider: rider)
                }
                
            }
            .animation(.easeInOut, value: tabSelection)
    }
}

// MARK: Tabs
struct RiderBioTab: View {
    
    var rider: Rider
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            HStack {
                VStack(alignment: .leading, spacing: 10){
                    RiderDataRow(rider: rider, label: "Born: ", data: rider.dob)
                    RiderDataRow(rider: rider, label: "Hometown: ", data: rider.hometown)
                    
                    HStack {
                        RiderDataRow(rider: rider, label: "Height: ", data:     rider.height)
                        Divider()
                            .background(Color.black)
                            .frame(width: 10, height: 20)
                        RiderDataRow(rider: rider, label: "Weight: ", data: String(rider.weight))
                    }
                    
                    RiderDataRow(rider: rider, label: "Sponsors: ", data: rider.sponsors.joined(separator: ", "))
                        .lineSpacing(2)
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
                
                
                Link(destination: URL(string:"https://www.motoamericaliveplus.com/viewplans")!) {
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
    
    @Environment(\.colorScheme) var colorScheme
//    @Binding var isExpanded: Bool
    var rider: Rider
    var races = [
        "Daytona 200",
        "MotoAmerica Superbikes At Texas",
        "MotoAmerica Superbikes At Atlanta",
        "MotoAmerica Superbikes At Virginia",
        "MotoAmerica Superbikes At Road America",
        "Dynapac MotoAmerica Superbikes At The Ridge",
        "Geico Motorcycle MotoAmerica Superbike Speedfest At Monterey",
        "MotoAmerica Superbikes At Minnesota",
        "MotoAmerica Superbikes At Pittsburgh",
        "MotoAmerica Superbikes At New Jersey",
        "MotoAmerica Superbikes At Alabama"
    ]
    
    var body: some View {
        GeometryReader { geo in
            // timing stack
//            VStack(spacing: 40) {
//                // timing rows
//                HStack(spacing: 20) {
//                    VStack(spacing: 10) {
//                        Text("POS")
//                            .bold()
//                        Text("1")
//                            .font(.subheadline)
//                    }
//                    VStack(spacing: 10) {
//                        Text("NUM")
//                            .bold()
//                        Text("35")
//                            .font(.subheadline)
//                    }
//                    VStack(spacing: 10) {
//                        Text("NAME")
//                            .bold()
//                        Text("Andy Birino")
//                            .font(.subheadline)
//                    }
//                    VStack(spacing: 10) {
//                        Text("MAKE")
//                            .bold()
//                        Text("KAW")
//                            .font(.subheadline)
//                    }
//                    VStack(spacing: 10) {
//                        Text("BEST LAP")
//                            .bold()
//                        Text("35.957")
//                            .font(.subheadline)
//                    }
//                }
//
//                Divider()
//
//                HStack(spacing: 20) {
//                    VStack(spacing: 10) {
//                        Text("DIFF")
//                            .bold()
//                        Text("12:59:59")
//                            .font(.subheadline)
//                    }
//                    VStack(spacing: 10) {
//                        Text("GAP")
//                            .bold()
//                        Text("PIT")
//                            .font(.subheadline)
//                    }
//
//                }
//
//                Divider()
//
//                HStack(spacing: 20) {
//                    VStack(spacing: 10) {
//                        Text("LAST LAP")
//                            .bold()
//                        Text("4:50:12")
//                            .font(.subheadline)
//                    }
//                    VStack(spacing: 10) {
//                        Text("S1")
//                            .bold()
//                        Text("2:00.14")
//                            .font(.subheadline)
//                    }
//                    VStack(spacing: 10) {
//                        Text("S2")
//                            .bold()
//                        Text("1:27.12")
//                            .font(.subheadline)
//                    }
//                    VStack(spacing: 10) {
//                        Text("S3")
//                            .bold()
//                        Text("1:30.66")
//                            .font(.subheadline)
//                    }
//                    VStack(spacing: 10) {
//                        Text("SPEED")
//                            .bold()
//                        Text("26.20")
//                            .font(.subheadline)
//                    }
//                }
//            }
//            .frame(maxWidth: geo.size.width)
//            .frame(height: geo.size.height)
//            .padding()
            
                List {
                    ForEach(races, id: \.self) { race in
                        Dropdown(label: race, content: ["String":"String"])
                    }
                    .accentColor(Color.ui.lightRed)
                }
                .listStyle(PlainListStyle())
                .listRowBackground(Color.black)
                .onAppear{ UITableView.appearance().showsVerticalScrollIndicator = false
                }
        }
    }
}


// Preview
struct RiderDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RiderDetailView(rider: RiderList.riders[4])
            .previewInterfaceOrientation(.portrait)
        RiderDetailView(rider: RiderList.riders[4])
            .preferredColorScheme(.dark)
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
//                .fontWeight(.semibold)
        }
    }
}
