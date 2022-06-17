//
//  SearchView.swift
//  Moto-App
//
//  Created by Tyrel Jackson on 6/16/22.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchText = ""
    var rider: Rider
    
    var body: some View {
        NavigationView{
         Text("\(searchText)")
            .searchable(text: $searchText, prompt: "Search Riders")
            .navigationBarTitle("Search")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
//    var searchResults: String {
//            if searchText.isEmpty {
//                return "Enter a Search Query"
//            } else {
//                return RiderList.riders.filter { $0.name.contains(searchText) }
//            }
//        }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(rider: RiderList.riders.first!)
    }
}
