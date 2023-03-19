//
//  HomeView.swift
//  AFSpaceA
//
//  Created by Ed Kraus on 3/4/23.

import SwiftUI

struct HomeView: View {
    
    
    //For Search Bar
    @State private var searchText = ""
    
    // Base locations
    var filteredLocations: [Locations] {
        if searchText.isEmpty {
            return Locations.allBases
        } else {
            return Locations.allBases.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    
    var body: some View {
        
        NavigationView {
            List(filteredLocations) { a in
                NavigationLink(
                    destination: DetailView(base: a),
                    label: {
                        // Each base card in the scrollview
                        CardView(base: a)
                    })
            }
        }
        
        .searchable(text: $searchText, prompt: "Search Base")
        .listStyle(.grouped)
        .navigationBarTitle("Bases")
        
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

