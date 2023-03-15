//
//  CardView.swift
//  AFSpaceA
//
//  Created by Ed Kraus on 2/26/23.
//


import SwiftUI

struct CardView: View {
    
    var base:Locations
    
    var body: some View {
        
        ZStack {
            //        TODO: Fix why the filter doesn't work
            
            // Text Stack
            VStack(alignment: .leading) {
                
                // Name
                Text(base.name)
                
                    .fontWeight(.bold)
            }
        }        
    }
}



