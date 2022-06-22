//
//  DataView.swift
//  Moto-App
//
//  Created by Tyrel Jackson on 6/21/22.
//

import SwiftUI

struct DataView: View {
    
    @State var results = [DataFromAPI]()
    var body: some View {
        List(results, id: \.self) { result in
            VStack {
                let _ = print(result.gender!)
                Text(result.gender!)
            }
        }
        .onAppear(perform: loadData)
    }
    
    func loadData() {
        
        guard let url = URL(string: "https://api.genderize.io/?name=luc") else {return}
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let response = try? JSONDecoder().decode([DataFromAPI].self, from: data) {
                    DispatchQueue.main.async {
                        self.results = response
                    }
                    
                    return
                }
            }
        }.resume()
    }
}
                    
struct DataFromAPI: Codable, Hashable{
    let name: String?
    let gender: String?
    let probability: Double?
    let count: Int?
}

struct DataView_Previews: PreviewProvider {
    static var previews: some View {
        DataView()
    }
}
