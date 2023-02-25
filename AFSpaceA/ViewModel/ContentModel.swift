////
////  ContentModel.swift
////  AFSpaceA
////
////  Created by Ed Kraus on 2/24/23.
////
//
import Foundation

class ContentModel: ObservableObject {
    @Published var locations = [Locations]()
    
   
    
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
            let locations = try jsonDecoder.decode([Locations].self, from: jsonData)
            
            // Assign parsed locations to locations property if successfully parsed
            self.locations = locations
            
        } catch {
            // TODO: log error
            print("Couldn't parse local data")
        }
    }
}


//
//struct Bases: Hashable, Codable{
//    let id: Int
//    let name, commercial, dsn, email, website: String
//}
//
//
//class ViewModel: ObservableObject {
//    @Published var bases: [Bases] = []
//    func getLocalData() {
//        
//        // Get a url to the json file
//        let jsonUrl = Bundle.main.url(forResource: "bases", withExtension: "json")
//        
//        do {
//            // Read the file into a data object
//            let jsonData = try Data(contentsOf: jsonUrl!)
//            
//            // Try to decode the json into an array of modules
//        
//            let bases = try JSONDecoder().decode([Bases].self, from: jsonData)
//            
//            // Append parsed modules into modules property
//                          DispatchQueue.main.async {
//                              self.bases += bases
//                          }
//            // Assign parsed modules to modules property
//            self.bases = bases
//        }
//        catch {
//            // TODO log error
//            print("Couldn't parse local data")
//            
//        }
//      
//    }
//    
//    
//// TODO: For later
////    func getRemoteData() {
////
////        // String path
////        let urlString = "https://sourkraut1991.github.io/learningapp-data/data2.json"
////
////        // Create URL Object
////        let url = URL(string: urlString)
////        guard url != nil else {
////            // Couldn't create url
////            return
////        }
////        // create a URLRequest Object
////        let request = URLRequest(url: url!)
////
////        //Get the Session and kick off the task
////        let session = URLSession.shared
////
////
////        let dataTask = session.dataTask(with: request) { (data, response, error) in
////            // Check if there is an error
////            guard error == nil else {
////                // There was an error
////                return
////            }
////            do {
////                //Create JSON Decover
////                let decoder = JSONDecoder()
////
////               let modules = try decoder.decode([Module].self, from: data!)
////
////                // Append parsed modules into modules property
////                DispatchQueue.main.async {
////                    self.modules += modules
////                }
////
////            }
////            catch {
////                //Couldn't parse json
////            }
////        }
////        // Kick off data task
////        dataTask.resume()
////    }
//    
//    
//}
