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
            let em = "\(base.email)"
            let wb = "\(base.website)"
           
            
            var webLink: AttributedString {
                try! AttributedString(markdown: "Website:  [\(wb)](\(wb))")
            }
            var emL: AttributedString {
                try! AttributedString(markdown: "Website:  [\(em)](\(em))")
            }
            
        
            VStack {
                
                
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
                    // TODO: Show Contact data of base
                    
                    Text(base.DSN)
                    Text(base.Commercial)
                    Text(emL)
                    Text(webLink)
                    
                    
                }
            }
            
            
        }
        
        
    }
}


