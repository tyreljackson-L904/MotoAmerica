//
//  RaceClassCell.swift
//  Moto-App
//
//  Created by Tyrel Jackson on 6/24/22.
//

import SwiftUI

struct RaceClassCell: View {
    
    var raceClass: RaceClass
    
    var body: some View {
        HStack{
            Image(raceClass.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 100,height: 70)
            
            Spacer()
            
            Text("\(raceClass.name)")
                .font(.headline)
                .lineLimit(2)
                .minimumScaleFactor(0.5)
        }
        
    }
}

struct RaceClassCell_Previews: PreviewProvider {
    static var previews: some View {
        RaceClassCell(raceClass: RaceList.classes.first!)
    }
}
