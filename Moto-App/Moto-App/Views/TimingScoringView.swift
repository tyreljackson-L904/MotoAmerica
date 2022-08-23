//
//  TimingScoringView.swift
//  Moto-App
//
//  Created by Tyrel Jackson on 6/16/22.
//

import SwiftUI

public struct TimingScoringView: View {
    
    var rider: Rider
    
    public var body: some View {
        
        VStack {
            TableHeaderView()
            
            Divider()
            
            TableView(rider: rider)
            
            Spacer()
        }
        .padding(.top, 25)
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

public struct TimingScoringView_Previews: PreviewProvider {
    public static var previews: some View {
        TimingScoringView(rider: RiderList.riders.first!)
        TimingScoringView(rider: RiderList.riders.first!)
            .preferredColorScheme(.dark)
    }
}

// MARK: Header Data
public struct TableHeaderView: View {
    
    public var body: some View {
        VStack(spacing: 10) {
            
            Text("Road America - MotoAmerica Championship at Road America")
                .font(.title3)
                .bold()
                .multilineTextAlignment(.center)
                .padding(.horizontal, 10)
            
            Divider()
                .frame(width: 200)
                .background(Color.gray)
            
            Text("R1 - Track Is Cold")
                .font(.headline)
                .bold()
            
            HStack(spacing: 10) {
                Text("Elapsed: 12:00")
                    .font(.subheadline)
                    .bold()
                Divider()
                    .background(Color.black)
                Text("Laps To Go: 12")
                    .font(.subheadline)
                    .bold()
                Divider()
                    .background(Color.black)
                Text("Time: 17:54:10")
                    .font(.subheadline)
                    .bold()
            }
            .frame(height: 20)
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 150)
    }
}

// MARK: Table Data
public struct TableView: View {
    @State private var showModal = false
    
    // Header Properties
    var columns = [
        GridItem(.fixed(50)), GridItem(.fixed(50)), GridItem(.fixed(100)), GridItem(.fixed(50)), GridItem(.fixed(80)),GridItem(.fixed(80)),GridItem(.fixed(80)),GridItem(.fixed(80)),GridItem(.fixed(80)),GridItem(.fixed(80)),GridItem(.fixed(80)),GridItem(.fixed(80)),GridItem(.fixed(80))
    ]
    
    var columnTitles = [
        "POS", "NUM", "NAME", "MAKE", "BEST LAP", "DIFF", "GAP", "LAST LAP", "S1", "S2", "S3", "S4", "SPEED"
    ]
    
    // Riders data model
    var riderData = RiderTiming.riderTiming
    var rider: Rider
    
//    let trimmedName = rider.name.trimmingCharacters(in: .)
    
    public var body: some View {
        NavigationView {
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    // title data
                    HStack(spacing: 40) {
                        LazyVGrid(columns: columns) {
                            ForEach(0..<columns.count, id: \.self) { title in
                                Text(columnTitles[title])
                                    .font(.system(size: 12))
                                    .bold()
                            }
                            .padding(.vertical)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    
                    Divider()
                    
                    // race/rider data
                    ScrollView(showsIndicators: false) {
                        ForEach(riderData, id: \.self) { data in
                            LazyVGrid(columns: columns) {
                                Group{
                                    Text("\(data.position)")
                                        .font(.system(size: 12))
                                        .bold()
                                    
                                    Text("\(data.num)")
                                        .font(.system(size: 12))
                                        .bold()
                                    
                                    if data.name.contains(" ") {
                                        
                                    }
                                    Text("\(data.name)")
                                        .font(.system(size: 12))
                                        .bold()
                                        .foregroundColor(.red)
                                        .multilineTextAlignment(.center)
                                    
                                    Text("\(data.make)")
                                        .font(.system(size: 12))
                                        .bold()
                                    
                                    Text("\(data.bestLap)")
                                        .font(.system(size: 12))
                                        .bold()
                                    
                                    Text("\(data.diff)")
                                        .font(.system(size: 12))
                                        .bold()
                                }
                                
                                Group{
                                    
                                    Text("\(data.gap)")
                                        .font(.system(size: 12))
                                        .bold()
                                    
                                    Text("\(data.lastLap)")
                                        .font(.system(size: 12))
                                        .bold()
                                    
                                    Text("\(data.s1)")
                                        .font(.system(size: 12))
                                        .bold()
                                    
                                    Text("\(data.s2)")
                                        .font(.system(size: 12))
                                        .bold()
                                    
                                    Text("\(data.s3)")
                                        .font(.system(size: 12))
                                        .bold()
                                    
                                    Text("\(data.s4)")
                                        .font(.system(size: 12))
                                        .bold()
                                    
                                    Text("\(data.speed)")
                                        .font(.system(size: 12))
                                        .bold()
                                }
                            }
                            .frame(maxWidth: .infinity)
                            .listRowInsets(EdgeInsets())
                            .padding(.vertical)
                        }
                        .onTapGesture {
                            self.showModal.toggle()
                        }
                        .sheet(isPresented: $showModal) {
                            RiderModalView(rider: rider)
                        }
                    }
                    
                }
            }
            .navigationTitle("")
            .navigationBarHidden(true)
        }
    }
    
    func shortenName(name: String) {
        
    }
    
}
