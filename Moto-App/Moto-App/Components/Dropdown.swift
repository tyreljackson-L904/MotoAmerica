//
//  Dropdown.swift
//  Moto-App
//
//  Created by Tyrel Jackson on 6/26/22.
//

import SwiftUI

struct Dropdown: View {
    
    @State private var isExpanded = false
    var label: String
    var content: [String:String] = ["DIFF":"18:30:23", "GAP": "01:01:01", "LAST LAP":"3:47.677", "S1":"1:06.677", "S2":"2:16.334", "S3":"4:03.999","S4":"1:06.677", "SPEED":"2:16.334"]
    //    var noContent = content.isEmpty
    
    var body: some View {
        let keys = content.map{$0.key}
        let values = content.map{$0.value}
        
        withAnimation(.easeInOut(duration: 0.7)) {
            DisclosureGroup(label, isExpanded: $isExpanded) {
                VStack {
                    if content.count == 0 {
                        emptyView
                            .padding()
                    } else {
                        ForEach(keys.indices, id: \.self) { index in
                            VStack(spacing: 0) {
                                HStack {
                                    Text(keys[index])
                                    
                                    Spacer(minLength: 0)
                                    
                                    Text("\(values[index])")
                                }
                                
                                Divider()
                            }
                        }
                    }
                }
                .multilineTextAlignment(.center)
            }
            .padding(.vertical)
        }
    }
    
////    @ViewBuilder
//    var emptyView: some View {
////        if content.count == 0 {
//            VStack {
//                Text("No Timing Data Available At This Time")
//                    .font(.headline)
//                    .padding(.vertical)
//                    .foregroundColor(Color.black.opacity(0.6))
//                Text("Check race schedule to see if race has started")
//                    .font(.headline)
//                    .foregroundColor(Color.black.opacity(0.6))
//            }
////        }
//    }
    
    
}

extension Dropdown {
    var emptyView: some View {
//        if content.count == 0 {
            VStack {
                Text("No Timing Data Available At This Time")
                    .font(.headline)
                    .padding(.vertical)
                    .foregroundColor(Color.black.opacity(0.6))
                Text("Check race schedule to see if race has started")
                    .font(.headline)
                    .foregroundColor(Color.black.opacity(0.6))
            }
//        }
    }
}

struct Dropdown_Previews: PreviewProvider {
    static var previews: some View {
        Dropdown(
            label: "MotorPark Superbike Speedway",
            content: ["DIFF":"18:30:23", "GAP": "01:01:01", "LAST LAP":"3:47.677", "S1":"1:06.677", "S2":"2:16.334", "S3":"4:03.999","S4":"1:06.677", "SPEED":"2:16.334"])
//        .preferredColorScheme(.dark)
    }
}
