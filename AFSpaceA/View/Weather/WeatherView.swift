//
//  WeatherView.swift
//  AFSpaceA
//
//  Created by Ed Kraus on 3/14/23.
//

import SwiftUI

struct WeatherView: View {
    let weather: Weather
    var body: some View {
        VStack {
            ForEach(weather.forecast, id: \.self) { weather in
                HStack(spacing: 20) {
                    Text(weather.date)
                    Text(weather.summary)
                    // Text(weather.minF)
                    // Text(weather.maxF)
                }
            }
        }
        
    }
}


