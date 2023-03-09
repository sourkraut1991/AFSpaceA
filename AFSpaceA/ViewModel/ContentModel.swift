////
////  ContentModel.swift
////  AFSpaceA
////
////  Created by Ed Kraus on 2/24/23.
////
//
import Foundation
import SwiftUI

class ContentModel: ObservableObject {
    
    @Published var bases = [Locations]()
    @Published var currency = [Currency]()
    private var regions: [Locations] = Locations.allBases
    //    private var currencies: [Currency] = Currency.self
    init() {
        // Get bases from local JSON
        self.bases = getLocalJson()
        // Download remote json file and parse data
    load()
    }
    
    func getLocalJson() -> [Locations] {
        
        let jsonUrl = Bundle.main.url(forResource: "bases", withExtension: "json")
        // Read the file into a data object
        do {
            
            let jsonData = try Data(contentsOf: jsonUrl!)
            
            // Try to decode the json into an array of modules
            let jsonDecoder = JSONDecoder()
            let bases = try jsonDecoder.decode([Locations].self, from: jsonData)
            
            // Assign parsed locations to locations property if successfully parsed
            self.bases = bases
            
            
        } catch {
            // TODO: log error
            print("Couldn't parse local data")
        }
        return bases
        
    }
    let beginningURL = "https://sourkraut1991.github.io/AFSpaceA-images/images/"
    
    func load() {
        
        let url = URL(string: "https://api.fastforex.io/fetch-all?api_key=demo")!
        
        
        
        URLSession.shared.dataTask(with: url) {(data,response,error) in
            
            do {
                
                if let d = data {
                    
                    let currencies = try JSONDecoder().decode([Currency].self, from: d)
                    
                    DispatchQueue.main.async {
                        
                        self.currency = currencies
                        
                    }
                    
                }else {
                    
                    print("No Data")
                    
                }
                
            } catch {
                
                print ("Error")
                
            }

        }.resume()
    }
}
