//
//  ButtonStyle.swift
//  SwiftUI-Chat
//
//  Created by ed on 12/10/22.
//

import Foundation
import SwiftUI

struct OnboardingButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        
        ZStack {
            Rectangle()
                .frame(height: 50)
                .cornerRadius(4)
                .foregroundColor(Color.blue)
            
            configuration.label
                .bold()
                .foregroundColor(Color.white)
        }
        
    }
    
}
