//
//  HomeView.swift
//  AFSpaceA
//
//  Created by Ed Kraus on 3/4/23.

import SwiftUI

struct HomeView: View {
    private var eucome: [Locations] = Locations.eucomBases
    private var conus: [Locations] = Locations.conusBases
    
    @ObservedObject var base = ContentModel()
    
    var body: some View {
        VStack {
            NavigationStack {
                
                List(eucome){ a in
                    NavigationLink(a.name){
                        DetailView(base: a)
                    }
                    .navigationBarTitle("Regions")
                }
                
            }
           
            
        }
        
    }
    
}
//    var bases = [
//        Locations(Commercial: base.Commercial, DSN: base?.DSN, email: base.email, id: base.id, image: base.image, name: base.name, region: base?.region, website: base.website),
//        Locations(Commercial: base.Commercial, DSN: base?.DSN, email: base.email, id: base.id, image: base.image, name: base.name, region: base?.region, website: base.website)
//    ]
//
//    // Declare what you want!
//    // You want an array of EUCOM bases.
//    var eucomBases: [Locations] {
//        bases.filter{$0.region == "EUCOM"} // <-- find region within your bases array
//    }
//
//    // Declear what you want!
//    // You want an array of CONUS bases.
//    var conusBases: [Locations] {
//        bases.filter{$0.region == "CONUS"} // same here.
//    }

//        }




//        // NavigationView to go to detail view
//        NavigationView {
//
//            ScrollView {
////                List(base.bases) { a in
////                    // VStack to group all the cards
////
////                    NavigationLink(destination: DetailView(base: a)) {
////                        Text(a.name)
////                    }
//
////                     Card for each base
////
////
////                                                // Link to detail view
//                ForEach(base.bases) { a in
////                    List {
////                        Text(a.name)
////                    }
//                                                NavigationLink(
//                                                    destination: DetailView(base: a),
//                                                    label: {
//
//                                                        // Each base card in the scrollview
//                                                        CardView(base: a)
//                                                    })
//                    }
//
//                }
//            .navigationBarTitle("Bases")
//
//            }
//
//
//        }
//

//    }
//


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
