//
//  CustomTabBar.swift
//  AFSpaceA
//
//  Created by Ed Kraus on 2/24/23.
//

import SwiftUI
import WebURL
import AsyncHTTPClient



enum Tabs: Int {
    case home = 0
    case about = 1
    case money = 2
    case wish = 3
}

struct CustomTabBar: View {
    @Binding var selectedTab: Tabs
    @Environment(\.openURL) var openURL
    
   
    var body: some View {
        TabView(selection: $selectedTab){
            ZStack{
                RoundedRectangle(cornerRadius: 10)
            HomeView()
            }
            .tabItem({
                Text("Home")
                Image(systemName: "house")
            })
            .tag(0)
            // If no meditation set, can't display detail

            ZStack{
                RoundedRectangle(cornerRadius: 10)
                
                      
              
                Text("https://www.amc.af.mil/AMC-Travel-Site/AMC-Space-Available-Travel-Page/Space-Available-Email-Sign-up-Form/")
            }.tabItem({
                Text("Sign-Up")
                Image(systemName: "link.circle")
            })
            .tag(2)
//            ZStack{
//                RoundedRectangle(cornerRadius: 10)
//                   AboutView()
//            }.tabItem({
//                Text("About")
//                Image(systemName: "info.circle")
//            })
//            .tag(2)
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                  WishListView()
            }.tabItem({
                Text("Wish List")
                Image(systemName: "square.and.pencil.circle")
            })
            .tag(3)
            
           
        }
    }}
