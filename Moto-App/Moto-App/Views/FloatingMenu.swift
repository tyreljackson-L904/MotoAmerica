//
//  FloatingMenu.swift
//  Moto-App
//
//  Created by Tyrel Jackson on 6/15/22.
//

import SwiftUI

struct FloatingMenu: View {
    
    @State var showMenuItem1 = false
    @State var showMenuItem2 = false
    @State var showMenuItem3 = false
    
    var rider: Rider
    
    var body: some View {
        
        VStack(alignment: .trailing) {
            
            Spacer()
            if showMenuItem1 {
                NavigationLink(destination: RaceClassView(rider: rider), label: {
                    MenuItem(icon: "person.fill", label: "Classes")
                })
            }
            if showMenuItem2 {
                NavigationLink(destination: RaceClassView(rider: rider), label: {
                    MenuItem(icon: "calendar", label: "Schedule")
                })
            }
            if showMenuItem3 {
                NavigationLink(destination: RaceClassView(rider: rider), label: {
                    MenuItem(icon: "video.fill", label: "Live Streaming")
                })
            }
            
            MenuButton(showMenuItem1: $showMenuItem1, showMenuItem2: $showMenuItem2, showMenuItem3: $showMenuItem3)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.trailing)
        .padding(.bottom)
        .edgesIgnoringSafeArea(.all)
    }
}

struct FloatingMenu_Previews: PreviewProvider {
    static var previews: some View {
        FloatingMenu(rider: RiderList.riders.first!)
        
        FloatingMenu(rider: RiderList.riders.first!)
            .preferredColorScheme(.dark)
    }
}



struct MenuItem: View {
    @Environment(\.colorScheme) var colorScheme
    
    var icon: String
    var label: String
    
    var body: some View {
        HStack {
            Text(label)
                .font(.title3)
                .fontWeight(.semibold)
                .padding(.trailing)
                .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
            
            Button {
                //
            } label: {
                ZStack {
                    Circle()
                        .foregroundColor(Color.ui.lightRed)
                        .frame(width: 75, height: 75)
                    Image(systemName: icon)
                        .imageScale(.large)
                        .foregroundColor(.white)
                        .shadow(color: .gray, radius: 0.2, x: 1, y: 1)
                }
            }
        }
        .transition(.move(edge: .trailing))
    }
}

struct MenuButton: View {
    
    @Binding var showMenuItem1: Bool
    @Binding var showMenuItem2: Bool
    @Binding var showMenuItem3: Bool
    
    var body: some View {
        HStack {
            Spacer()
            Button {
                self.showMenu()
            } label: {
                Image(systemName: "line.3.horizontal.circle.fill")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .foregroundColor(Color.ui.lightRed)
                    .shadow(color: .gray, radius: 0.2, x: 1, y: 1)
            }
            .padding(8)
        }
    }
    
    func showMenu() {
        withAnimation {
            showMenuItem3.toggle()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
            withAnimation {
                self.showMenuItem2.toggle()
            }
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
            self.showMenuItem1.toggle()
        })
    }
}
