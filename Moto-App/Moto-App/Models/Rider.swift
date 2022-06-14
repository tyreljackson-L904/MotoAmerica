//
//  Rider.swift
//  Moto-App
//
//  Created by Tyrel Jackson on 6/11/22.
//

import SwiftUI

struct Rider: Identifiable, Hashable {
    let id = UUID()
    let riderImage: String
    let name: String
    let bikeNumber: Int
    let nationality: String
    let sponsors: [String]
    let team: String
    let bike: String
    let hometown: String
    let height: String
    let weight: Int
    let dob: String
}


struct RiderList {
    static let riders = [
        Rider(riderImage: "AndyBirino", name: "Andy Birino", bikeNumber: 62, nationality: "USA", sponsors: ["KTM USA", "Motul", "WP USA", "SENA", "MotoSport.com", "MotoSport Hillsboro", "Solid Performance", "Rottweiler Performance", "Dunlop Tires", "EDR Performance", "Superlite Sprocketes", "See See Motor Coffee Co.", "Samco Sport", "Bagaros Performance", "Motion Pro", "ODI Grips", "ASV", "NJK Leathers", "Alpinestars", "HJC Helmets", "Bickle Racing", "Oregon Motorcycle Attorney", "CrossBeam Builders", "Ever True Tattoo"], team: "JLC Concrete/KTM/DiBrino Racing", bike: "2020 Kawasaki ZX-10R", hometown: "Tualatin, OR", height: "6'11", weight: 160, dob: "June 10th, 1994"),
        Rider(riderImage: "AshtonYates", name: "Ashton Yates", bikeNumber: 22, nationality: "USA", sponsors: ["Hayes", "Aftercare", "Regina", "Renthal"], team: "Aftercare Hayes Scheibe Racing", bike: "2018 BMW S 1000 RR", hometown: "Milledgeville, GA", height: "6'2", weight: 175, dob: "April 2nd, 1999"),
        Rider(riderImage: "BrandonPaasch", name: "Brandon Paasch", bikeNumber: 96, nationality: "USA", sponsors: ["Classic Car Club of Manhattan", "Luxestar VIP", "Altus Motorsports"], team: "Altus Motorsports", bike: "2021 Suzuki GSX-R1000", hometown: "Freehold, NJ", height: "6'1", weight: 170, dob: "March 16th, 2001"),
        Rider(riderImage: "CameronPeterson", name: "Cameron Peterson", bikeNumber: 45, nationality: "South Africa", sponsors: [], team: "Fresh N Lean Progressive Yamaha Racing", bike: "2021 Yamaha YZF-R1", hometown: "Corona, CA", height: "5'9", weight: 155, dob: "December 2nd, 1994"),
        Rider(riderImage: "CoreyAlexander", name: "Corey Alexander", bikeNumber: 23, nationality: "USA", sponsors: ["Hudson Valley Motorcycles", "Chuckwalla Valley Raceway", "New Rage Cycles", "Arai Helmets", "Alpinestars", "JLS Mechanical", "Prestige Services Group", "Frank Madden Painting", "Sals Pizza & Pasta"], team: "Tytlers Cycle/RideHVMC Racing", bike: "2022 BMW M 1000 RR", hometown: "Westchester, NY", height: "6'4", weight: 170, dob: "May 23rd, 1994"),
        Rider(riderImage: "DallasShermanJr", name: "Dallas Sherman Jr", bikeNumber: 40, nationality: "USA", sponsors: ["Mozart Properties", "A1 Property", "Brighton Radiator", "Colorado Excavating", "Monkey Gripp", "Cycle Gear", "Underground Railroad Transport", "64 Degree Racing", "Suomi"], team: "Team Posse", bike: "2018 Yamaha YZF-R1M", hometown: "Denver, CO", height: "6'0", weight: 180, dob: "June 16th, 1993"),
        Rider(riderImage: "DanilloLewis", name: "Danillo Lewis", bikeNumber: 94, nationality: "Brazil", sponsors: ["Tecfil", "2MT", "Cordona", "Jeskap", "Milwaukee Cycle", "DRP", "DuraFloors", "GB Racing", "EBC Brakes", "Reded", "Fiber Racing", "Alfa X", "Sanrad Sport", "Van Paletera", "IOG"], team: "Tecfil Racing", bike: "2021 BMW S 1000 RR ", hometown: "Osasco, Brazil", height: "5'8", weight: 160, dob: "November 20th, 1992"),
        Rider(riderImage: "DaniloPetrucci", name: "Danilo Petrucci", bikeNumber: 9, nationality: "Italy", sponsors: [], team: "Warhorse HSBK Racing Ducati NYC", bike: "2021 Ducati Panigale V4 R", hometown: "Terni, Italy", height: "5'11", weight: 165, dob:"October 24th, 1990"),
        Rider(riderImage: "DavidAnthony", name: "David Anthony", bikeNumber: 25, nationality: "Australia", sponsors: [], team: "ADR Motorsports", bike: "2022 Suzuki GSX-R1000", hometown: "Murrieta, CA", height: "5'11", weight: 175, dob: "July 1st, 1981"),
        Rider(riderImage: "DavidLambert", name: "David Lambert", bikeNumber: 28, nationality: "USA", sponsors: ["Kawasaki", "Dunlop", "Langbros Leathers", "Rocky Mountain Cycle Plaza", "HJC Helmet", "Evol Technology", "Vortex", "SBS Brakes", "D&S Paint", "Rex Coulthard", "Yoder Paintwork & Fiberglass"], team: "Lambert Motorsports", bike: "2018 Kawasaki ZX-10R", hometown: "Pueblo, CO", height: "5'10", weight: 180, dob: "April 24th, 1978")
    ]
}


