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
            
            
            // Background Image
            Image(base.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .cornerRadius(30)
            
            // Text Stack
            VStack(alignment: .leading) {
                
                // Name
                Text(base.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                
                
            }
            .padding([.top, .leading], 10.0)
            .shadow(color: .black, radius: 10, x: 2, y: 2)
            
        }
        
    }
}



