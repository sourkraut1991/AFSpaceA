//
//  HomeView.swift
//  AFSpaceA
//
//  Created by Ed Kraus on 3/4/23.

import SwiftUI

struct HomeView: View {
    let weather: Forecast
    
    //For Search Bar
    @State private var searchText = ""
    
    // Base locations
    private var allBases: [Locations] = Locations.allBases
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



