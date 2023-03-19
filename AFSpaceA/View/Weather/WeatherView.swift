//
//  WeatherView.swift
//  AFSpaceA
//
//  Created by Ed Kraus on 3/14/23.
//

import SwiftUI





struct WeatherView: View {
    @StateObject var vm = ContentModel()
    var body: some View {
        
        VStack {
            if let weather = vm.weather {
                Text("Current temperature in \(weather.name): \(weather.main.temp)°C")
            } else {
                Text("Loading...")
            }
        }
        .onAppear {
            guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=London&appid=YOUR_API_KEY_HERE&units=imperial") else {
                return
            }
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data else {
                    return
                }
                
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                do {
                    let decodedData = try decoder.decode(Weather.self, from: data)
                    DispatchQueue.main.async {
                        self.vm.weather = decodedData
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }.resume()
        }
    }
}
