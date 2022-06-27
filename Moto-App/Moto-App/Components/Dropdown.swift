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
    var content: [String:String]
    
    var body: some View {
        let keys = content.map{$0.key}
        let values = content.map{$0.value}

        DisclosureGroup(label, isExpanded: $isExpanded) {
            VStack {
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
        }
        .padding()
    }
}

struct Dropdown_Previews: PreviewProvider {
    static var previews: some View {
        Dropdown(
            label: "MotorPark Superbike Speedway",
            content: [
                "POS":"1",
                "NUM":"23",
            ])
//        .preferredColorScheme(.dark)
    }
}
