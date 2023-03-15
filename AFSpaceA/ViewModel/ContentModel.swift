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
    @Published var weather = [Weather]()
    
    
    @Published var bases = [Locations]()
    @Published var currency = [Currency]()
    
    private var regions: [Locations] = Locations.allBases
    //    private var currencies: [Currency] = Currency.self
    init() {
        // Get bases from local JSON
        self.bases = getLocalJson()
        // Download remote json file and parse data
     fetchWeather()
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
        //Handle Errors with these 2 var's
    @Published var hasError = false
    @Published var error : UserError?
        func fetchWeather() {
            
            hasError = false
            
            let url = URL(string: "https://www.amdoren.com/api/weather.php?api_key=AhiqGphbmnbH2hTqXmd2n68skL8p8j&lat=40.7127837&lon=-74.0059413")!
            
            // Call API
            URLSession
                .shared
                .dataTask(with: url) { [weak self] data, response, error in
                    
                    DispatchQueue.main.async {
                        
                        if let error = error {
                           
                            self?.hasError = true
                            self?.error = UserError.custom(error: error)
                            
                        } else {
                            let decoder = JSONDecoder()
                            decoder.keyDecodingStrategy = .convertFromSnakeCase // Handles properties that look like first_last to camel case (firstlast)
                            
                            if let data = data,
                               let weather = try? decoder.decode([Weather].self, from: data) {
                                
                                // TODO: Handle setting the data
                                self?.weather = weather // weather being set
                                
                            } else {
                                //TODO: handle errors
                                self?.hasError = true
                                self?.error = UserError.failedToDecode
                            }
                        }
                    }
                        //TODO: Handle returning data on the Main thread
                    }
                    .resume() // Starts task and executes for me and handle response in closure
                
        } // End of Load func
} // End of Class

//From tunsdev https://www.youtube.com/watch?v=r3O90QGKv98
extension ContentModel {
    enum UserError: LocalizedError {
    case custom(error: Error)
    case failedToDecode
        
        var errorDescription: String? {
            switch self {
            case .failedToDecode:
                return "Failed to decode response"
            case .custom(let error):
                return error.localizedDescription
            
            }
        }
    }
}
