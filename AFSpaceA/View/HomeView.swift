//
//  HomeView.swift
//  AFSpaceA
//
//  Created by Ed Kraus on 3/4/23.

import SwiftUI

struct HomeView: View {
    let weather: Forecast
    //    private var eucom: [Locations] = Locations.eucomBases
    //    private var conus: [Locations] = Locations.conusBases
    private var allBases: [Locations] = Locations.allBases
    
    @ObservedObject var base = ContentModel()
    @State private var searchText = ""
    
    var filteredLocations: [Locations] {
        if searchText.isEmpty {
            return allBases
        } else {
            return allBases.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    
    var body: some View {
        VStack {
            NavigationView {
                List(filteredLocations) { a in                
                    NavigationLink(
                        destination: DetailView(base: a, weather: weather),
                        label: { 
                            // Each base card in the scrollview
                            CardView(base: a)
                        })
                }
                
                .searchable(text: $searchText, prompt: "Search Base")
                    .listStyle(.grouped)
                    .navigationBarTitle("Bases")
            }
        }
    }
    
}



