//
//  DetailView.swift
//  AFSpaceA
//
//  Created by Ed Kraus on 2/26/23.
//

import SwiftUI
import AVKit

struct DetailView: View {
    let beginningURL = "https://sourkraut1991.github.io/AFSpaceA-images/images/"
    var base: Locations?
    @Environment(\.openURL) var openURL
    var body: some View {
        
        // If no meditation set, can't display detail
        if let base = base  {
            
            VStack {
                //        TODO: Fix why the filter doesn't work
                
                ZStack {
                    // Background Image
                    AsyncImage(url: URL(string: beginningURL + base.image + ".jpg")!) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(30)
                    } placeholder: {
                        Image(systemName: "photo.fill")
                    }       
                    // Base name
                    Text(base.name)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                .padding(.bottom, -10)
                List {
                    Text("tele:" + base.Commercial)
//                    Link("DSN: ", destination: URL(string: "tele:" + base.DSN)!)
                    Link("Commercial: ", destination: URL(string: "tele:" + base.Commercial)!)
//                    Link("Email: ", destination: URL(string: "mailto:" + base.email)!)
                    Link("Website: ", destination: URL(string: base.website)!)
                }
            }
                    Spacer()
                    
                }
          
            }
        }
    

