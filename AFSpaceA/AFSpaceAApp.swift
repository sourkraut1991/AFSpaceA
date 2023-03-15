//
//  AFSpaceAApp.swift
//  AFSpaceA
//
//  Created by Ed Kraus on 2/22/23.
//

import SwiftUI
import WishKit

@main
struct AFSpaceAApp: App {
    init() {
        WishKit.configure(with: "48F301E6-9B7D-46C5-90A4-401F19643817")
    }
    @StateObject var vm = ContentModel()
    
    var body: some Scene {
        WindowGroup {
            RootView(weather: Forecast(date: "", minF: 0, maxF: 0, summary: "", icon: ""))
                .environmentObject(ContentModel())
        }
    }
}
