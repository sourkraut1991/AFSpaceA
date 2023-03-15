//
//  ContentView.swift
//  AFSpaceA
//
//  Created by Ed Kraus on 2/22/23.
//

//

import SwiftUI
import WishKit

struct RootView: View {
    @StateObject var vm = ContentModel()
   @StateObject var base = ContentModel()
    @State var selectedTab: Tabs = .home
    
    @State var hasError = false
   
    var body: some View {
        ZStack {
           
            
            VStack {
                
                switch selectedTab {
                case .home:
                    HomeView()
                        
                case .about:
                    AboutView()
                case .money:
                    MoneyHome(currency: [Currency].init())
                case .wish:
                    WishListView()
                }
                
                Spacer()
                
                    CustomTabBar(selectedTab: $selectedTab)
                
            }
            }
    }
}
