//
//  DiningData.swift
//  DineUMD
//
//  Created by Ethan Jacob Lott on 11/9/23.
//

import Foundation

@Observable
class DiningData: ObservableObject {
    //var menuDates: [MenuDate] = combineStations(menuDates: load("diningMenus.json"))
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
}

func combineStations(menuDates: Array<MenuDate>) -> Array<MenuDate> {
    var newMenuDates = menuDates
    for day in 0...7 {
        for m in 0...3 {
            for st in menuDates[day].halls[2].meals[m].stations {
                switch (st.id / 10) {
                case 1600:
                    print("boiler")
                    break
                default:
                    print("none")
                }
                
            }
            // South Campus combo stations
            newMenuDates[day].halls[2].meals[m].stations.append(Station(name: "Broiler Works", id: 16000, items:[]))
            newMenuDates[day].halls[2].meals[m].stations.append(Station(name: "Grill Works", id: 16010, items:[]))
            newMenuDates[day].halls[2].meals[m].stations.append(Station(name: "Chef's Table", id: 16020, items:[]))
            newMenuDates[day].halls[2].meals[m].stations.append(Station(name: "Purple Zone", id: 16060, items:[]))
            newMenuDates[day].halls[2].meals[m].stations.append(Station(name: "Roaster", id: 51010, items:[]))
            newMenuDates[day].halls[2].meals[m].stations.append(Station(name: "Roma Vegan", id: 51010, items:[]))
            newMenuDates[day].halls[2].meals[m].stations.append(Station(name: "Mongolian Grill", id: 51010, items:[]))
            
            // 251 combo stations
            newMenuDates[day].halls[2].meals[m].stations.append(Station(name: "Chef's Table", id: 51040, items:[]))
            newMenuDates[day].halls[2].meals[m].stations.append(Station(name: "Harvest", id: 51050, items:[]))
            newMenuDates[day].halls[2].meals[m].stations.append(Station(name: "Ciao", id: 51020, items:[]))
            newMenuDates[day].halls[2].meals[m].stations.append(Station(name: "Purple Zone", id: 51000, items:[]))
            newMenuDates[day].halls[2].meals[m].stations.append(Station(name: "Smash", id: 51010, items:[]))
        }
    }
    
    for menuDate in menuDates {
        for diningHall in menuDate.halls {
            for meal in diningHall.meals {
                if diningHall.name == "Yahentamitsi" {
                    
                }
                else if diningHall.name == "South Campus" {
                    
                } else {
                }
            }
        }
    }
    return menuDates
}
