//
//  RaceClass.swift
//  Moto-App
//
//  Created by Tyrel Jackson on 6/11/22.
//

import SwiftUI

struct RaceClass: Identifiable {
    let id = UUID()
    let imageName: String
    let name: String
}

struct RaceList {
    static let classes = [
        RaceClass(imageName: "Supersport", name: "Supersport"),
        RaceClass(imageName: "Medallia-Superbike", name: "Medallia Superbike"),
        RaceClass(imageName: "BTR-Royal-Enfield", name: "Royal Enfield"),
        RaceClass(imageName: "King-of-the-Baggers", name: "King of the Baggers"),
        RaceClass(imageName: "Minicup-110cc", name: "Minicup 110cc"),
        RaceClass(imageName: "Minicup-160cc", name: "Minicup 160cc"),
        RaceClass(imageName: "Minicup-190cc", name: "Minicup 190cc"),
        RaceClass(imageName: "STG-Junior-Cup", name: "STG Junior Cup"),
        RaceClass(imageName: "Super-Hooligan", name: "Super Hooligan"),
        RaceClass(imageName: "Twins-Cup", name: "Twins Cup"),
        RaceClass(imageName: "YUASA-Stock-1000", name: "YUASA Stock 1000")
    ]
}
