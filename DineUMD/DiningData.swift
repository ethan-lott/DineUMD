//
//  DiningData.swift
//  DineUMD
//
//  Created by Ethan Jacob Lott on 11/9/23.
//

import Foundation

@Observable
class DiningData: ObservableObject {
    var menuDates: [MenuDate] = load("diningMenus.json")
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    if let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
        // Create a file URL for the diningMenus.json file in the document directory
        let file = documentsDirectory.appendingPathComponent(filename)
        
        do {
            // Read the JSON data from the file
            data = try Data(contentsOf: file)
            
            // Parse JSON data using JSONDecoder
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            print("Error reading JSON data: \(error)")
        }
    }
    return T.self as! T

//    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
//    else {
//        fatalError("Couldn't find \(filename) in main bundle.")
//    }
//
//
//    do {
//        data = try Data(contentsOf: file)
//    } catch {
//        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
//    }
//
//
//    do {
//        let decoder = JSONDecoder()
//        return try decoder.decode(T.self, from: data)
//    } catch {
//        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
//    }
}
