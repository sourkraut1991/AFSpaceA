//
//  ContentView.swift
//  AFSpaceA
//
//  Created by Ed Kraus on 2/22/23.
//

//

import SwiftUI
import WishKit

//WishKit.configure(with: "48F301E6-9B7D-46C5-90A4-401F19643817")

struct RootView: View {

    
    
    
    init() {
        WishKit.configure(with: "48F301E6-9B7D-46C5-90A4-401F19643817")
    }
    
    
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
                case .money:
                    MoneyHome()
                case .wish:
                    WishListView()
                }
                
                Spacer()
                CustomTabBar(selectedTab: $selectedTab)
            }
                
            }
    }
}
