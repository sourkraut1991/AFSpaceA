//
//  DetailView.swift
//  AFSpaceA
//
//  Created by Ed Kraus on 2/26/23.
//

import SwiftUI
import AVKit

struct DetailView: View {
    
    var base: Locations?
    @Environment(\.openURL) var openURL
    var body: some View {
        
        // If no meditation set, can't display detail
        if let base = base  {
        
            VStack(alignment: .leading, spacing: 20.0) {
               
                
                // Base name
                Text(base.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)

              
                Text("DSN: " + base.DSN)
                Text("Commercial: " + base.Commercial)
              
                //TODO: Fix Email and email links
                Text("Email: " + base.email)
                Text("Website: " + base.website)
                
            
                Spacer()
                
            }.padding()
        }
    }
}

