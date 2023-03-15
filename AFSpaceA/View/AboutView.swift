//
//  AboutView.swift
//  AFSpaceA
//
//  Created by Ed Kraus on 3/2/23.
//

import SwiftUI

struct AboutView: View {
    @State private var items = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"]
    @State private var newItem = ""

    var body: some View {
        VStack {
            HStack {
                TextField("New item", text: $newItem)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Add") {
                    withAnimation {
                        self.items.append(self.newItem)
                        self.newItem = ""
                    }
                }
            }
            List {
                ForEach(items, id: \.self) { item in
                    Text(item)
                }
            }
           
        }
        .padding()
    }
}


struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
