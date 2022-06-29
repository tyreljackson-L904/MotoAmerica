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
    var content: [String:String] = [:]
    //    var noContent = content.isEmpty
    
    var body: some View {
        let keys = content.map{$0.key}
        let values = content.map{$0.value}
        
        withAnimation(.easeInOut(duration: 0.7)) {
            DisclosureGroup(label, isExpanded: $isExpanded) {
                VStack {
                    emptyView
                        .padding()
                    ForEach(keys.indices, id: \.self) { index in
                        VStack(spacing: 10) {
                            HStack(spacing: 10) {
                                Text(keys[index])
                                Text("\(values[index])")
                            }
                            HStack(spacing: 10) {
                                Text(keys[index])
                                Text("\(values[index])")
                            }
                            HStack(spacing: 10) {
                                Text(keys[index])
                                Text("\(values[index])")
                            }
                        }
                        
                    }
                }
                .multilineTextAlignment(.center)
            }
            .padding(.vertical)
        }
    }
    
    @ViewBuilder
    var emptyView: some View {
        if content.count == 0 {
            VStack {
                Text("No Timing Data Available At This Time")
                    .font(.headline)
                    .padding(.vertical)
                    .foregroundColor(Color.black.opacity(0.6))
                Text("Check race schedule to see if race has started")
                    .font(.headline)
                    .foregroundColor(Color.black.opacity(0.6))
            }
        }
    }
}



struct Dropdown_Previews: PreviewProvider {
    static var previews: some View {
        Dropdown(
            label: "MotorPark Superbike Speedway",
            content: [:])
//        .preferredColorScheme(.dark)
    }
}
