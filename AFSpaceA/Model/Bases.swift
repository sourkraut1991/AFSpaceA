//
//  Bases.swift
//  AFSpaceA
//
//  Created by Ed Kraus on 2/24/23.
//

import Foundation


struct Locations : Decodable, Identifiable {
    var id: Int
    var name: String
    var region: String
    var Commercial: String
    var DSN: String
    var email: String
    var website: String
    

}

