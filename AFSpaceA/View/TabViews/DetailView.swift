//
//  DetailView.swift
//  AFSpaceA
//
//  Created by Ed Kraus on 2/26/23.
//

import SwiftUI
import AVKit




struct DetailView: View {
    let beginningURL = "https://sourkraut1991.github.io/AFSpaceA-images/images/" //Maximize storage
    @Environment(\.openURL) var openURL // For hyperlinking
    var base: Locations?
    
    @StateObject var vm = ContentModel()

    var body: some View {
        
        // If no meditation set, can't display detail
        if let base = base  {        
            let wb = "\(base.website)"
            
            
            var webLink: AttributedString {
                try! AttributedString(markdown: "Website:  [\(wb)](\(wb))")
            }
        
            
            
            VStack {
                
                ZStack {
                    // Background Image
                    AsyncImage(url: URL(string: beginningURL + base.image + ".jpg")!) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                    } placeholder: {
                        Image(systemName: "photo.fill")
                    }
                }
                // Base name
                Text(base.name)
                    .font(.title3)
                    .fontWeight(.bold)
                //                .padding(.bottom, -10)
              
//                WeatherView()
                
                
                List {
                    // TODO: Show Contact data of base
                    
                    Text("DSN: " + base.DSN) .textSelection(.enabled)
                    Text("Commercial: " + base.Commercial) .textSelection(.enabled)
                    Text("Email: " + base.email) .textSelection(.enabled)
                    Text(webLink)
                    
                    
                }
                
            }
            
            
        }
        
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
