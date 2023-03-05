//
//  Bases.swift
//  AFSpaceA
//
//  Created by Ed Kraus on 2/24/23.
//

import Foundation


struct Locations: Codable, Identifiable {
    
    // Generate samples
    static let allBases: [Locations] = Bundle.main.decode(file: "bases.json")
    static let sampleBase: Locations = allBases[0]
    
    static var regionLocations = ["AMC CONUS TERMINALS", "EUCOM TERMINALS", "INDOPACOM TERMINALS", "CENTCOM TERMINALS", "SOUTHCOM TERMINALS", "NON-AMC CONUS TERMINALS", "ANG & RESERVE TERMINALS"]
    //// Declare what you want!
    //// You want an array of EUCOM bases.
    static var eucomBases: [Locations] {
        Locations.allBases.filter{$0.region == "EUCOM"} // <-- find region within your bases array
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
}


// Turn your JSON into an array of Base objects.
// Hint: It's now an array! It's not JSON anymore.
// Want to make this auto-fill name in from json, right? As opposed to having to manually type each out.. defeats the point of json, right?

//

