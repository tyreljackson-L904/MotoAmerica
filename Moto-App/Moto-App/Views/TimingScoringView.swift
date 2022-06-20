//
//  TimingScoringView.swift
//  Moto-App
//
//  Created by Tyrel Jackson on 6/16/22.
//

import SwiftUI

public struct TimingScoringView: View {
    
    public var body: some View {
        VStack {
            TableHeaderView()
            
            Divider()
            
            TableView()
            
            Spacer()
        }
        .padding(.top, 25)
    }
}

public struct TimingScoringView_Previews: PreviewProvider {
    public static var previews: some View {
        TimingScoringView()
        TimingScoringView()
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
    
    // Header Properties
    var columns = Array(repeating: GridItem(.flexible(minimum: 20)), count: 5)
    var columnTitles = ["POS", "NUM", "NAME", "MAKE", "BEST LAP"]
    var formatter = DateComponentsFormatter()
    
    // Riders data model
    var riders = [
        TimingDataModel(position: 1, num: 62, name: "Andy Birino", make: "KAW", bestLap: "12.30"),
        TimingDataModel(position: 2, num: 22, name: "Ashton Yates", make: "BMW", bestLap: "8.40"),
        TimingDataModel(position: 3, num: 96, name: "Brandon Paasch", make: "SUZ", bestLap: "9.20"),
        TimingDataModel(position: 4, num: 45, name: "Cameron Peterson", make: "YAM", bestLap: "7.32"),
        TimingDataModel(position: 5, num: 23, name: "Corey Alexander", make: "BMW", bestLap: "11.21"),
        TimingDataModel(position: 6, num: 40, name: "Dallas Sherman Jr", make: "YAM", bestLap: "10.81"),
        TimingDataModel(position: 7, num: 94, name: "Danilo Lewis", make: "BMW", bestLap: "10.73"),
        TimingDataModel(position: 8, num: 9, name: "Danilo Petrucci", make: "DUC", bestLap: "9.87"),
        TimingDataModel(position: 9, num: 25, name: "David Anthony", make: "SUZ", bestLap: "12.11"),
        TimingDataModel(position: 10, num: 28, name: "David Lambert", make: "KAW", bestLap: "11.11")
    ]
    // Rider dictionary
    
        
    public var body: some View {
        VStack {
            List(0..<10, id: \.self) { row in
                HStack {
                    ForEach(0..<5) { title in
                        Text(columnTitles[title])
                    }
                    .listRowInsets(EdgeInsets())
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 22)
                .listRowBackground(row % 2 == 0 ? Color.gray : Color.gray.opacity(0.4))
            }
            .listStyle(PlainListStyle())
        }
    }
}






//            LazyVGrid(columns: columns) {
//
//                // columnTitle row
//                ForEach(0..<5) { titles in
//                    Text(columnTitles[titles]).bold()
//                }
//                .padding(.bottom)
//            }
            
//            List(riders.count, id: \.self) { count in
//                LazyVGrid(columns: columns) {
//                    ForEach(0..<5) { titles in
//                        Text(columnTitles[titles])
//                        ForEach(riders, id: \.self) { rider in
//                            HStack(alignment: .center, spacing: 30) {
//                                Text("\(rider.position)")
//                                Text("\(rider.num)")
//                                Text("\(rider.name)")
//                                Text("\(rider.make)")
//                                Text("\(rider.bestLap)")
//                            }
//                            .frame(maxWidth: .infinity)
//                            .listRowInsets(EdgeInsets())
//                            .listRowBackground(Color.clear)
//                        }
//
//                    }
//                }
//            }
//            .background(Color.white)
