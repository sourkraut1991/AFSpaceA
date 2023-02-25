//
//  CustomTabBar.swift
//  AFSpaceA
//
//  Created by Ed Kraus on 2/24/23.
//

import SwiftUI

struct CustomTabBar: View {
    var body: some View {
        HStack {
            Spacer()
            Button {
           //Button's Action
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
            Button {
           //* Button's Action - Sign Up for Space-A
                //https://www.amc.af.mil/AMC-Travel-Site/AMC-Space-Available-Travel-Page/Space-Available-Email-Sign-up-Form/
                //*
            } label: {
                
                VStack (alignment: .center, spacing: 4) {
                    Image(systemName: "house")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32)
                    
                    Text("Sign Up")
                }
                
            }
           Spacer()
        }
    }
}


struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar()
    }
}
