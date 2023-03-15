//
//  Bases.swift
//  AFSpaceA
//
//  Created by Ed Kraus on 2/24/23.
/// https://www.amdoren.com/api/currency.php for weather as well

import Foundation



struct Currency: Codable, Identifiable {
    let id = UUID()
    let error: Int
    let errorMessage: String
    let amount: Double
    
    enum CodingKeys: String, CodingKey {
        case error
        case errorMessage = "error_message"
        case amount
    }
}

struct Weather: Codable, Identifiable, Hashable {    
    let id = UUID()
    let error: Int
    let errorMessage: String
    let forecast: [Forecast]
    
    enum CodingKeys: String, CodingKey {
        case error
        case errorMessage = "error_message"
        case forecast
    }
}

// MARK: - Forecast
struct Forecast: Codable, Hashable, Identifiable {
    let id = UUID()
    let date: String
    let minF: Int
    let maxF: Int
    let summary, icon: String
    
    enum CodingKeys: String, CodingKey {
        case date
        case minF = "min_f"
        case maxF = "max_f"
        case summary, icon
    }
    
}
struct Locations: Codable, Identifiable {
    
    // Generate samples
    static let allBases: [Locations] = Bundle.main.decode(file: "bases.json")
    
    static let sampleBase: Locations = allBases[0]
    
    //    var regionLocations = ["AMC CONUS TERMINALS", "EUCOM TERMINALS", "INDOPACOM TERMINALS", "CENTCOM TERMINALS", "SOUTHCOM TERMINALS", "NON-AMC CONUS TERMINALS", "ANG & RESERVE TERMINALS"]
    //// Declare what you want!
    //// You want an array of EUCOM bases.
    static var eucomBases: [Locations] {
        Locations.allBases.filter{$0.name == "EUCOM"} // <-- find region within your bases array
    }
    //
    //// Declear what you want!
    //// You want an array of CONUS bases.
    static var conusBases: [Locations] {
        Locations.allBases.filter{$0.region == "CONUS"} // same here.
    }
    
    
    enum CodingKeys: String, CodingKey, CaseIterable {
        case Commercial
        case DSN
        case email
        case id
        case image
        case name
        case region
        case website
    }
    
    let Commercial: String
    let DSN: String
    let email: String
    let id: Int
    let image: String
    let name: String
    let region: String
    let website: String
    
    init(Commercial: String, DSN: String, email: String, id: Int, image: String, name: String, region: String, website: String) {
        self.Commercial = Commercial
        self.DSN = DSN
        self.email = email
        self.id = id
        self.image = image
        self.name = name
        self.region = region
        self.website = website
        
    }
    
}

// Extension to decode JSON locally
extension Bundle {
    
    func decode<T: Decodable>(file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Could not find \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Could not load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        
        guard let loadedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Could not decode \(file) from bundle.")
        }
        
        return loadedData
    }
} // End Of Bundle Extension
