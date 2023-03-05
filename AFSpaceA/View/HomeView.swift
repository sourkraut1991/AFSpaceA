//
//  HomeView.swift
//  AFSpaceA
//
//  Created by Ed Kraus on 3/4/23.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var base = ContentModel()
    
    var body: some View {
        NavigationStack {
            
            List(base.bases){ a in
                NavigationLink(a.name) {
                    DetailView(base: a)
                }
                
            }
        }
        
        .navigationBarTitle("Bases")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
