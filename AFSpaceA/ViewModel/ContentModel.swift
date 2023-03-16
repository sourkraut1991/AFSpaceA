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
    @Published var forecast = [Forecast]()
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
        let urlString = "https://www.amdoren.com/api/weather.php?api_key=AhiqGphbmnbH2hTqXmd2n68skL8p8j&lat=40.7127837&lon=-74.0059413"
        let url = URL(string: urlString)
        
        guard url != nil else {
            return
        }
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!) { data, response, error in
            
            // Check for errors
            if error == nil && data != nil {
                do {
                    // Parse JSON
                    let decoder = JSONDecoder()
                    let weather = try decoder.decode(Weather.self, from: data!)
                    print(weather)
                    
                }
                catch {
                    print("Error in json parsing")
                }
            }
        }
            // Make the API Call
            dataTask.resume()
    }
    // Beginning to get currency
    func fetchStocks() {
        let urlString = "https://www.amdoren.com/api/currency.php?api_key=AhiqGphbmnbH2hTqXmd2n68skL8p8j&from=USD&to=EUR"
        let url = URL(string: urlString)
        
        guard url != nil else {
            return
        }
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!) { data, response, error in
            
            // Check for errors
            if error == nil && data != nil {
                do {
                    // Parse JSON
                    let decoder = JSONDecoder()
                    let currency = try decoder.decode(Currency.self, from: data!)
                    print(currency)
                }
                catch {
                    print("Error in json parsing")
                }
            }
        }
            // Make the API Call
            dataTask.resume()
    }
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
