//
//  ContentView.swift
//  AFSpaceA
//
//  Created by Ed Kraus on 2/22/23.
//

//

import SwiftUI

struct RootView: View {
    
    @ObservedObject var base = ContentModel()
    @State var selectedTab: Tabs = .home
    
    var body: some View {
        ZStack {
           
            
            VStack {
                
                switch selectedTab {
                case .home:
                    HomeView()
                case .about:
                    AboutView()
                }
                
                Spacer()
                CustomTabBar(selectedTab: $selectedTab)
            }
                
            }
    }
}
