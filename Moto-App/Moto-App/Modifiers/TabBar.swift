//
//  TabBarAppearance.swift
//  Moto-App
//
//  Created by Tyrel Jackson on 7/28/22.
//

import SwiftUI

struct TabBar {
    
    static let shared = TabBar()
    
    func tabBarAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
}


