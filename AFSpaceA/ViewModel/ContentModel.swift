////
////  ContentModel.swift
////  AFSpaceA
////
////  Created by Ed Kraus on 2/24/23.
////
//
import Foundation

class ContentModel: ObservableObject {
    @Published var bases = [Locations]()
  
    init() {
        
        getLocalData()
        
    }



    func getLocalData() {
        // Get a url to the json file
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
    }
}
