//
//  TextModifier.swift
//  Moto-App
//
//  Created by Tyrel Jackson on 6/23/22.
//

import SwiftUI
import Foundation

struct TextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .foregroundColor(Color.white)
            .frame(width: 280, height: 70)
            .background(Color.ui.lightRed)
            .cornerRadius(8)
    }
}
