//
//  ContentView.swift
//  AFSpaceA
//
//  Created by Ed Kraus on 2/22/23.
//

import SwiftUI

struct RootView: View {
    
    @ObservedObject var base = ContentModel()
    
    var body: some View {
        
        // NavigationView to go to detail view
        NavigationView {
            
            ScrollView {
                
                // VStack to group all the cards
                VStack(alignment: .leading) {
                    
                    // Card for each base
                    ForEach(base.bases) { a in
                        
                        // Link to detail view
                        NavigationLink(
                            destination: DetailView(base: a),
                            label: {
                                
                                // Each base card in the scrollview
                                CardView(base: a)
                            })
                        
                    
                        
                    }
                }
                
            }
           
            .navigationBarTitle("Bases")
        }
        CustomTabBar()
    }
}
