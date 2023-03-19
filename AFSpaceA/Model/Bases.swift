//
//  Bases.swift
//  AFSpaceA
//
//  Created by Ed Kraus on 2/24/23.
// https://v6.exchangerate-api.com/v6/3af64b8ec60e3e731a5c3068/latest/USD

import Foundation



// MARK: - Currency
struct Currency: Codable {
    let result: String
    let documentation, termsOfUse: String
    let timeLastUpdateUnix: Int
    let timeLastUpdateUTC: String
    let timeNextUpdateUnix: Int
    let timeNextUpdateUTC, baseCode: String
    let conversionRates: [String: Double]

    enum CodingKeys: String, CodingKey {
        case result, documentation
        case termsOfUse = "terms_of_use"
        case timeLastUpdateUnix = "time_last_update_unix"
        case timeLastUpdateUTC = "time_last_update_utc"
        case timeNextUpdateUnix = "time_next_update_unix"
        case timeNextUpdateUTC = "time_next_update_utc"
        case baseCode = "base_code"
        case conversionRates = "conversion_rates"
    }
}

struct Weather: Codable {
    var name: String
    var main: Main
}

struct Main: Codable {
    var temp: Double
}

struct Locations: Codable, Identifiable {
    // Generate samples
    static let allBases: [Locations] = Bundle.main.decode(file: "bases.json")
    
    static let sampleBase: Locations = allBases[0]
    
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
