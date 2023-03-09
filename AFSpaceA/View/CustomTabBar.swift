//
//  CustomTabBar.swift
//  AFSpaceA
//
//  Created by Ed Kraus on 2/24/23.
//

import SwiftUI

enum Tabs: Int {
    case home = 0
    case about = 1
    case money = 2
//    case wish = 3
}

struct CustomTabBar: View {
    @Binding var selectedTab: Tabs
    @Environment(\.openURL) var openURL
    
    var body: some View {
        
        HStack {
            
            Spacer()
            Button {
                //Button's Action
                selectedTab = .home
            } label: {
                
                VStack (alignment: .center, spacing: 4) {
                    Image(systemName: "house")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32)
                    
                    Text("Home")
                }
                
            }
            Spacer()
            
            
            VStack (alignment: .center, spacing: 4) {
                Button {
                    //Button's Action
                    openURL(URL(string: "https://www.amc.af.mil/AMC-Travel-Site/AMC-Space-Available-Travel-Page/Space-Available-Email-Sign-up-Form/")!)
                } label: {
                    
                    VStack (alignment: .center, spacing: 4) {
                        Image(systemName: "globe")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 32, height: 32)
                        Text("Sign Up")
                    }
                }
            }
            Spacer()
            Button {
                selectedTab = .about
            } label: {
                
                VStack (alignment: .center, spacing: 4) {
                    Image(systemName: "i.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32)
                    
                    Text("About")
                }
            }
                Spacer()
                Button {
                    selectedTab = .money
                } label: {
                    
                    VStack (alignment: .center, spacing: 4) {
                        Image(systemName: "i.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 32, height: 32)
                        
                        Text("Currency Converter")
                    }
            }
            Spacer()
//            Button {
//                selectedTab = .wish
//            } label: {
//                
//                VStack (alignment: .center, spacing: 4) {
//                    Image(systemName: "i.circle")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 32, height: 32)
//                    
//                    Text("Currency Converter")
//                }
//        }
      
        }
        .padding(.top)
        .background(Color.gray)
    }
    
}


