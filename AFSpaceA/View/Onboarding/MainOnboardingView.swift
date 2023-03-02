//
//  MainOnboardingView.swift
//  AFSpaceA
//
//  Created by Ed Kraus on 3/2/23.
//

import SwiftUI

enum OnboardingStep: Int {
    case welcome = 0
    
}

struct MainOnboardingView: View {
//    @Binding var currentStep: OnboardingStep
    var body: some View {
        VStack {
            Spacer()
            
            Image("onboarding-welcome")
            
            Text("Welcome to AF Space A")
                .bold()
                .padding(.top, 32)
            
            Text("Your refrence to all Military Space-A")
               
                .padding(.top, 8)
            
            
            Spacer()
            
            Button {
                // Next step
//                currentStep = .welcome
                
            } label: {
                
                Text("Get Started")
                
            }
            .buttonStyle(OnboardingButtonStyle())
            
            Text("By tapping ‘Get Started’, you agree to our Privacy Policy.")
              
                .padding(.top, 14)
                .padding(.bottom, 61)

            
        }
        .padding(.horizontal)
        
    }
}
struct MainOnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        MainOnboardingView()
    }
}
