//
//  RiderDetailView.swift
//  Moto-App
//
//  Created by Tyrel Jackson on 6/12/22.
//

import SwiftUI

struct RiderDetailView: View {
    
    @State private var tabSelection = 2
    
    var rider: Rider
    var rows = [GridItem(.adaptive(minimum: 50))]
    
    var body: some View {
        VStack(spacing: 0) {
            Picker("Select" ,selection: $tabSelection) {
                Text("Bio").tag(1)
                Text("Stats").tag(2)
                Text("Timing & Scoring").tag(3)
            }
            .pickerStyle(SegmentedPickerStyle())
            
            Image("\(rider.riderImage)")
                .resizable()
//                .frame(width: .infinity, height: 400)
                .scaledToFit()
                .clipped()
                
                VStack(spacing: 0) {
                    Rectangle()
                        .frame(maxWidth: .infinity, maxHeight: 5)
                        .foregroundColor(Color.ui.lightRed)
                    
                    if tabSelection == 1 {
                        RiderBioTab(rider: rider)
                    } else if tabSelection == 2 {
                        RiderStatsTab(rider: rider)
                    } else {
                        Text("\(rider.team)")
                    }
                    
                    Spacer()
                }
                .background(Color.white)
//                .frame(maxHeight: 400)
            
            Spacer()
        }
        .padding(.top, 20)
        .background(Color.white)
    }
}


struct RiderBioTab: View {
    
    var rider: Rider
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            HStack {
                VStack(alignment: .leading, spacing: 10){
                    HStack {
                        Text("Name: ")
                            .font(.headline)
                            .fontWeight(.semibold)
                        + Text("\(rider.name)")
                            .underline(color: Color.ui.grayBlue)
                    }
                    HStack {
                        Text("Date of Birth: ")
                            .font(.headline)
                            .fontWeight(.semibold)
                        + Text("\(rider.dob)")
                    }
                    HStack {
                        Text("Hometown: ")
                            .font(.headline)
                            .fontWeight(.semibold)
                        + Text("\(rider.hometown)")
                    }
                    HStack {
                        Text("Height: ")
                            .font(.headline)
                            .fontWeight(.semibold)
                        + Text("\(rider.height)")
                    }
                    HStack {
                        Text("Weight: ")
                            .font(.headline)
                            .fontWeight(.semibold)
                        + Text("\(rider.weight)")
                    }
                    HStack {
                        Text("Team: ")
                            .font(.headline)
                            .fontWeight(.semibold)
                        + Text("\(rider.team)")
                    }
                    HStack {
                        Text("Bike: ")
                            .font(.headline)
                            .fontWeight(.semibold)
                        + Text("\(rider.bike)")
                    }
                    HStack {
                        Text("Sponsors: ")
                            .font(.headline)
                            .fontWeight(.semibold)
                    }
                    HStack {
                        Text("Biography: ")
                            .font(.headline)
                            .fontWeight(.semibold)
                        + Text("Californian Jake Gagne simply dominated the 2021 MotoAmerica Superbike Series to earn his first Superbike crown and his third AMA Championship, the Fresh N’ Lean Attack Performance Yamaha Racing team leader crushing the record books en route to the title. Gagne won a record 17 out of 20 races on the team’s Yamaha YZF-R1, including a record-setting 16 in a row. Gagne returns to the team in 2022 and will begin the campaign as the heavy favorite to win a second Superbike title.                                                                                                                                                     After suffering a mechanical failure in the opening race of the season at Michelin Raceway Road Atlanta, Gagne went on a tear, winning the next 17 races in a row. He wasn’t stopped until the first of three races in the series finale at Barber Motorsports Park when Mother Nature wreaked havoc with a torrential downpour. In race two at Barber, Gagne finished third and, fittingly, he won the final race of the season on Sunday in Alabama.                                                                                                                      The Superbike Championship is the third AMA title for Gagne as he won the AMA Daytona SportBike Championship in 2015 and was crowned champion of the inaugural MotoAmerica Superstock 1000 Championship in 2015. Gagne won 11 races during his 2015 championship-winning campaign.                                                                                                                                  In 2018, the former youth motocrosser competed overseas in the World Superbike Championship on a Ten Kate Honda but returned stateside to the MotoAmerica Superbike Championship in 2019 and rode a Scheibe Racing BMW to eighth in the title chase.                                                                                                                                            Gagne, who was born and raised in San Diego, California, now resides in Durango, Colorado.                                                                                      Little Known Fact: Jake Gagne qualified for and raced in the 2015 Lucas Oil AMA Pro Motocross Championship round at the Utah Motorsports Campus and very nearly finished in the top 20.")
                    }
                }
                .padding()
                
                Spacer()
            }
        }
    }
}

struct RiderStatsTab: View {
    var rider: Rider
    var body: some View {
        
        VStack {
            Text("\(rider.name)")
                .bold()
                .font(.title3)
                .padding(.vertical, 8)
            
            HStack(spacing: 40) {
                Text("Wins: 12")
                    .fontWeight(.semibold)
                Text("Podiums: 21")
                    .fontWeight(.semibold)
            }
            .font(.title3)
            .frame(maxWidth: .infinity)
            
            Button {
                // action
            } label: {
                Text("Watch Highlights")
                    .bold()
                    .font(.title3)
                    .frame(width: 250, height: 50)
                    .background(Color.ui.lightRed)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                
            }
        }
        .frame(height: 250)
    }
}

struct RiderDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RiderDetailView(rider: RiderList.riders[8])
    }
}
