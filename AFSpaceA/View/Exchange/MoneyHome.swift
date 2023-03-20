//
//  MoneyHome.swift
//  AFSpaceA
//
//  Created by Ed Kraus on 3/9/23.
//

import SwiftUI


struct MoneyHome: View {
    @ObservedObject var base = ContentModel()
    
    @State private var userInput = ""
    @State private var selectedCurrency1 = "USD"
    @State private var selectedCurrency2 = "EUR"
    @State private var conversionRate = 0.9
    @State private var currentRate = 0
    let currencySymbols = ["USD", "EUR", "GBP", "JPY"]
    
    var convertedAmount: Double {
        let amount = Double(userInput) ?? 0.0
        return amount * conversionRate
    }
    
    var body: some View {
        NavigationView {
                    Form{
                        TextField("Enter amount", text: $userInput)
                            .keyboardType(.decimalPad)
                        
                        Section(header: Text("Convert from")) {
                            Picker("Currency 1", selection: $selectedCurrency1) {
                                ForEach(currencySymbols, id: \.self) {
                                    Text($0)
                                }
                            }
                            .pickerStyle(.automatic)
                        }
                        
                        Section(header: Text("Convert to")) {
                            Picker("Currency 2", selection: $selectedCurrency2) {
                                ForEach(currencySymbols, id: \.self) {
                                    Text($0)
                                }
                            }
                            .pickerStyle(.automatic)
                        }
                        
                        Section(header: Text("Result")) {
                            Text("\(convertedAmount, specifier: "%.2f") \(selectedCurrency2)")
                        }
                        
                    }
                    .navigationBarTitle("Currency Converter")
            
                }
            }
       
    
    
    struct MoneyHome_Previews: PreviewProvider {
        static var previews: some View {
            MoneyHome()
        }
    }
}
