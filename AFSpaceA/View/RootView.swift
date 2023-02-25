//
//  ContentView.swift
//  AFSpaceA
//
//  Created by Ed Kraus on 2/22/23.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var base: ContentModel
    
    var body: some View {
        ScrollView {
           
            // Put in place to start text farther down visibly
            Rectangle()
                .frame(width: 100, height: 100)
            
            ForEach(base.bases) { base in
                Text(base.name)
            }
        }
        CustomTabBar()
    }
    }

