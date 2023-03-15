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
    let weather: Forecast
    @StateObject var base = ContentModel()
    @State var selectedTab: Tabs = .home
    
    @State var hasError = false
    
    var body: some View {
        ZStack {
            VStack {                
                switch selectedTab {
                case .home:
                    HomeView(weather: Forecast(date: "", minF: 0, maxF: 0, summary: "", icon: ""))
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
