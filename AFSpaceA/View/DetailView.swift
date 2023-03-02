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
            
            VStack {
                //        TODO: Fix why the filter doesn't work
                
                ZStack {
                    // Background Image
                    Image(base.image ?? "")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(30)
                    
                    // Text Stack
                    
                    // Base name
                    Text(base.name)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                .padding(.bottom, -10)
                List {
                    Text("DSN: " + base.DSN)
                    Text("Commercial: " + base.Commercial)
                    
                    //TODO: Fix Email and email links
                    Text("Email: " + base.email)
                    Text("Website: " + base.website)
                    
                }
            }
                    Spacer()
                    
                }
          
            }
        }
    

