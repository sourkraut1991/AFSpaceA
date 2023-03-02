//
//  CardView.swift
//  AFSpaceA
//
//  Created by Ed Kraus on 2/26/23.
//


import SwiftUI

struct CardView: View {
    
    var base:Locations
    let beginningURL = "https://sourkraut1991.github.io/AFSpaceA-images/images/"
    
    
    var body: some View {
        
        ZStack {
            //        TODO: Fix why the filter doesn't work
            AsyncImage(url: URL(string: beginningURL + base.image)!) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(30)
            } placeholder: {
                Image(systemName: "photo.fill")
                //            // Background Image
                //            Image(base.image ?? "")
                //                .resizable()
                //                .aspectRatio(contentMode: .fill)
                //                .cornerRadius(30)
                
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
            .clipped()
            .cornerRadius(15)
            .padding([.leading, .trailing])
        }
    }
    
}
 
