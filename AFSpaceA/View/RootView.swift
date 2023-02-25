//
//  ContentView.swift
//  AFSpaceA
//
//  Created by Ed Kraus on 2/22/23.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var base:ContentModel
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(base.locations) { base in
                    Text(base.region)
                }
            }
        }
    }
    }

