//
//  MoneyHome.swift
//  AFSpaceA
//
//  Created by Ed Kraus on 3/9/23.
//

import SwiftUI


struct MoneyHome: View {
    @ObservedObject var base = ContentModel()
    var body: some View {
        List(base.currency) { currency in
            Text("\(currency.result)")
        }
    }
}

struct MoneyHome_Previews: PreviewProvider {
    static var previews: some View {
        MoneyHome()
    }
}
