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
        VStack {
            NavigationView {
                //            ForEach(base.bases) { a in
                List(base.bases) { a in
                    NavigationLink(a.name) {
                        if a.region == "CONUS" {
                            
                            DetailView(base: a)
                            
                        }
                        else if a.region == "EUCOM" {
                            
                            DetailView(base: a)
                        }
                    }
                    
                }
                }
        }
    }
}
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
////        CustomTabBar()
//    }
//
