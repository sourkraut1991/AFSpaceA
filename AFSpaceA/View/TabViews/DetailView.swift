//
//  DetailView.swift
//  AFSpaceA
//
//  Created by Ed Kraus on 2/26/23.
//

import SwiftUI
import AVKit




struct DetailView: View {
    let beginningURL = "https://sourkraut1991.github.io/AFSpaceA-images/images/" //Maximize storage
    @Environment(\.openURL) var openURL // For hyperlinking
    var base: Locations?
    let weather: Weather
    @StateObject var vm = ContentModel()
    
    
    
    var body: some View {
        
        // If no meditation set, can't display detail
        if let base = base  {
            let em = "\(base.email)"
            let wb = "\(base.website)"
            
            
            var webLink: AttributedString {
                try! AttributedString(markdown: "Website:  [\(wb)](\(wb))")
            }
            var emL: AttributedString {
                try! AttributedString(markdown: "Email:  [\(em)](\(em))")
            }
            
            
            VStack {
                
                ZStack {
                    // Background Image
                    AsyncImage(url: URL(string: beginningURL + base.image + ".jpg")!) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                    } placeholder: {
                        Image(systemName: "photo.fill")
                    }
                }
                // Base name
                Text(base.name)
                    .font(.title3)
                    .fontWeight(.bold)
                //                .padding(.bottom, -10)
                Text("Before")
//                TODO: Provide 3 day weather
                                ForEach(weather.forecast, id: \.self) { weather in
                                    HStack(spacing: 20) {
                                        Text(weather.date)
                                        Text(weather.summary)
                                        Text(weather.icon)
                                    }
                                }
                                    }
                            .onAppear(perform: vm.fetchWeather)
                Text("After")
                
                List {
                    // TODO: Show Contact data of base
                    
                    Text("DSN: " + base.DSN) .textSelection(.enabled)
                    Text("Commercial: " + base.Commercial) .textSelection(.enabled)
                    Text(emL) .textSelection(.enabled)
                    Text(webLink)
                    
                    
                }
                
            }
            
            
        }
        
        
    }

