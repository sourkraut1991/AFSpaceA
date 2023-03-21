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
    @Published var weather: Weather?
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
    
    
    func fetchWeather() {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=London&appid=6707c62d4b0fa031d94a09f02babb951&units=metric") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            do {
                let decodedData = try decoder.decode(Weather.self, from: data)
                DispatchQueue.main.async {
                    self.weather = decodedData
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
        // Beginning to get currency
        func fetchStocks() {
            let urlString = "https://v6.exchangerate-api.com/v6/3af64b8ec60e3e731a5c3068/latest/USD"
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

