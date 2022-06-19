//
//  TimingScoringView.swift
//  Moto-App
//
//  Created by Tyrel Jackson on 6/16/22.
//

import SwiftUI

struct TimingDataModel: Identifiable, Hashable {
    let id = UUID()
    let position: Int
    let num: Int
    let name: String
    let make: String
    let bestLap: TimeInterval
}

struct TimingData {
    static var timing = [
        TimingDataModel(position: 1, num: 62, name: "Andy Birino", make: "KAW", bestLap: 12.30),
        TimingDataModel(position: 2, num: 22, name: "Ashton Yates", make: "BMW", bestLap: 8.40),
        TimingDataModel(position: 3, num: 96, name: "Brandon Paasch", make: "SUZ", bestLap: 9.20),
        TimingDataModel(position: 4, num: 45, name: "Cameron Peterson", make: "YAM", bestLap: 7.32),
        TimingDataModel(position: 5, num: 23, name: "Corey Alexander", make: "BMW", bestLap: 11.21),
        TimingDataModel(position: 6, num: 40, name: "Dallas Sherman Jr", make: "YAM", bestLap: 10.81),
        TimingDataModel(position: 7, num: 94, name: "Danilo Lewis", make: "BMW", bestLap: 10.73),
        TimingDataModel(position: 8, num: 9, name: "Danilo Petrucci", make: "DUC", bestLap: 9.87),
        TimingDataModel(position: 9, num: 25, name: "David Anthony", make: "SUZ", bestLap: 12.11),
        TimingDataModel(position: 10, num: 28, name: "David Lambert", make: "KAW", bestLap: 11.11)
    ]
}

struct RaceDataModel: Identifiable {
    let id = UUID()
    let elapsed: Double
    let lapsToGo: Int
    let time: Double
}

struct TimingScoringView: View {
    
        let timing: TimingDataModel
    
    var body: some View {
        VStack {
            TableHeaderView()
            
            Divider()
            
            TableView(timing: timing)
            
            Spacer()
        }
        .padding(.top, 25)
    }
}

struct TimingScoringView_Previews: PreviewProvider {
    static var previews: some View {
        TimingScoringView(timing: TimingData.timing.first!)
        TimingScoringView(timing: TimingData.timing.first!)
            .preferredColorScheme(.dark)
    }
}

//struct GridStack<Content: View>: View {
//    let rows: Int
//    let columns: Int
//    let content: (Int, Int) -> Content
//
//    var body: some View {
//        VStack {
//            ForEach(0 ..< rows, id: \.self) { row in
//                HStack {
//                    ForEach(0 ..< columns, id: \.self) { column in
//                        content(row, column)
//                    }
//                }
//            }
//        }
//    }
//
//    init(rows: Int, columns: Int, @ViewBuilder content: @escaping (Int, Int) -> Content) {
//        self.rows = rows
//        self.columns = columns
//        self.content = content
//    }
//}

struct TableHeaderView: View {
    
    var body: some View {
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

struct TableView: View {
    
    let timing: TimingDataModel
    let columns = Array(repeating: GridItem(.flexible(minimum: 20)), count: 5)
    let columnTitles = ["POS", "NUM", "NAME", "MAKE", "BEST LAP"]
    
    var body: some View {
        LazyVGrid(columns: columns) {
            
            // columnTitle row
            ForEach(0..<5) { titles in
                Text(columnTitles[titles]).bold()
            }
            .padding(.bottom)
            
            // rows
            ForEach(Array(arrayLiteral: timing), id: \.self) { row in
                HStack {
                    Text("\(timing.position)")
                }
            }
            
        }
    }
}

//LazyVGrid(columns: columns) {
//    // first headline row
//    ForEach(rowTitles, id: \.self) { title in
//        Text("\(title)")
//            .bold()
//            .foregroundColor(.white)
//    }
//}
//.background(Color.ui.grayBlue)

//VStack {
//    HStack(spacing: nil) {
//        ForEach(listHeaderItem, id: \.self) { title in
//            List {
//                Text(title)
//                    .font(.subheadline)
//                    .bold()
//                    .listRowInsets(EdgeInsets())
//                    .listRowBackground(Color.clear)
//            }
//            .listStyle(PlainListStyle())
//            .frame(height: 30)
//            .background(Color.gray)
//        }
//    }
//    .padding(.leading, 5)
//    .padding(.trailing, 5)
//}
