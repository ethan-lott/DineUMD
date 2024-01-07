//
//  MenuScraper.swift
//  DineUMD
//
//  Created by Jason Lott on 1/6/24.
//

import Foundation
import SwiftSoup

let hall_nums = [
    "South Campus": 16,
    "Yahentamitsi": 19,
    "251 North": 51
]
let SouthCampus_IDs = [
    "Broiler Works": 16000,
    "Broiler Works Sides": 16001,
    "Grill Works": 16010,
    "Grill Works Sides": 16011,
    "Chef's Table": 16020,
    "Chef's Table Sides": 16021,
    "Salad Bar": 16030,
    "Treats": 16040,
    "Waffle, Doughnut, Bagel Bar": 16050,
    "Purple Zone": 16060,
    "Purple Zone Sides": 16061,
    "Roaster": 16070,
    "Roaster Sides": 16071,
    "Pasta": 16080,
    "Pizza": 16090,
    "Soup Du Jour": 16100,
    "Deli": 16110,
    "Deli+": 16111,
    "Roma Vegan Salads and Panini": 16120,
    "Roma Vegan Sides": 16121,
    "Vegan Desserts": 16130,
    "Mongolian Grill": 16140,
    "Mongolian Grill Made to Ord": 16141
]
let Yahentamitsi_IDs = [
    "Breakfast": 19000,
    "Breakfast Sides": 19001,
    "Good Food Gluten Free": 19010,
    "Good Food GF Sides": 19011,
    "Sprouts": 19020,
    "Sprouts Sides": 19021,
    "Terp Comfort": 19030,
    "Terp Comfort Sides": 19031,
    "Salad Bar": 19040,
    "Maryland Bakery": 19050,
    "Mezza": 19060,
    "Mezza Sides": 19061,
    "Chef's Corner": 19070,
    "Chef's Corner Sides": 19071,
    "Joe's Grill": 19080,
    "Joe's Grill Sides": 19081,
    "Terp Grain Bowl": 19090,
    "Woks": 19100
]
let north_IDs = [
    "Purple Zone": 51000,
    "Purple Zone-ALL DAY": 51001,
    "Smash Deli": 51010,
    "Smash Burger": 51011,
    "Ciao Chilled Salads": 51020,
    "Ciao Pizza": 51021,
    "Ciao Pasta": 51022,
    "Ciao Entree": 51023,
    "Chef's Table Mains": 51040,
    "Chef's Table Extras": 51041,
    "Chef's Table Vegetarian": 51042,
    "Halal at Chef's Table": 51043,
    "Harvest Entree": 51050,
    "Harvest Greens": 51051,
    "Harvest Vegan": 51052,
    "Soups": 51060,
    "Scoops Homemade Ice Cream": 51070
]
let meal_ids = [
    "Breakfast": 1,
    "Brunch": 2,
    "Lunch": 3,
    "Dinner": 4
]
class MenuScraper {
    
    func getData() -> [Dictionary<String,Any>] {
        let startTime = DispatchTime.now()
        print("start")
        var days: [Dictionary<String,Any>] = []
        var d_id = 0
        var item_id = 0
        
        for d_shift in 0...6 { // For each date
            // Shift date
//            let date = Date(timeIntervalSinceNow: TimeInterval(d_shift * 60 * 60 * 24))
            var dateq = DateComponents()
            dateq.year = 2023
            dateq.month = 11
            dateq.day = 1
            let calendar = Calendar.current
            let date = calendar.date(from: dateq)!
            let year = calendar.component(.year, from: date)
            let month = calendar.component(.month, from: date)
            let day = calendar.component(.day, from: date)
            let d_str = "\(month)/\(day)/\(year)"
            var halls: [Dictionary<String,Any>] = []
            let semaphore = DispatchSemaphore(value: 0)
            for (hall, hall_num) in hall_nums {
                var html = ""
                self.getHTML(aURL: "https://nutrition.umd.edu/?locationNum=\(hall_num)&dtdate=\(d_str)") { result in
                    if result.isEmpty {
                        print("error getting the html")
                    } else {
                        self.parseHTML(html: result, hall: hall, hallNum: hall_num) { result in
                            switch result {
                                case .success(let data):
                                    halls = data
                                case .failure(let error):
                                    print("Error: \(error.localizedDescription)")
                                }
                            semaphore.signal()
                        }
                    }
                }
            }
            semaphore.wait()
            days.append(["date": d_str, "id": d_id, "halls": halls])
            print(d_id)
            d_id += 1
        }
        let endTime = DispatchTime.now()
        print("end")
        let nanoTime = endTime.uptimeNanoseconds - startTime.uptimeNanoseconds
        let executionTime = Double(nanoTime) / 1_000_000_000

        print("Execution time: \(executionTime) seconds")
        return days
    }
    private func getHTML(aURL: String, completion: ( (String) -> (Void) )?) {
                let url = URL(string: aURL)!
                let task = URLSession.shared.dataTask(with: url)
                {
                    (data, response, error) in
                    guard let data = data else { return }
                    let tempHTML = String(data: data, encoding: .utf8)!

                    completion?(tempHTML)
                }
                task.resume()
    }
    private func parseHTML(html: String, hall: String, hallNum: Int, completion: @escaping (Result<[Dictionary<String,Any>], Error>) -> Void) {
        var stationIds: Dictionary<String, Int>
        if hall == "South Campus" {
            stationIds = SouthCampus_IDs
        } else if hall == "251 North" {
            stationIds = north_IDs
        } else {
            stationIds = Yahentamitsi_IDs
        }
        var recipeId = 0
        var halls: [Dictionary<String,Any>] = []
        let doc: Document = try! SwiftSoup.parseBodyFragment(html)
        var meals: [Dictionary<String,Any>] = []
        let mealPanels = try! doc.select("div[role = tabpanel]")
        if (!mealPanels.isEmpty()) {
            var mealNames: [String] = []
            if mealPanels.size() == 3 {
                mealNames = ["Breakfast", "Lunch", "Dinner"]
            } else if mealPanels.size() == 2 {
                mealNames = ["Brunch", "Dinner"]
            }
            var actMenus = 0
            for meal in mealPanels {
                var locations: [Dictionary<String,Any>] = []
                for loc in try! meal.select("div[class = card]") {
                    let locName = try! loc.select("h5[class = card-title]").text()
                    var recipes: [Dictionary<String,Any>] = []
                    for recipe in try! loc.select("div[class = row menu-item-row]") {
                        let recipeName = try! recipe.select("a[class = menu-item-name]").text()
                        var restrictions: [String] = []
                        for restriction in try! recipe.select("img[class = nutri-icon]") {
                            restrictions.append(try! restriction.attr("title"))
                        }
                        recipes.append(["name": recipeName, "id": recipeId, "restrictions": restrictions])
                        recipeId += 1
                    }
                    if (!stationIds.keys.contains(locName)) {
                        stationIds[locName] = stationIds.values.max()! + 10
                    }
                    locations.append(["name": locName, "id": stationIds[locName]!, "items": recipes])
                }
                meals.append(["name": mealNames[actMenus], "id": meal_ids[mealNames[actMenus]]!, "stations": locations])
                actMenus += 1
            }
            while (actMenus < mealNames.count) {
                meals.append(["name": mealNames[actMenus], "id": meal_ids[mealNames[actMenus]]!, "stations": "No Data Available"])
                actMenus += 1
            }
            halls.append(["name": hall, "id": hall_nums[hall]!, "meals": meals])
        } else {
            halls.append(["name": hall, "id": hall_nums[hall]!, "meals": "No Data Available"])
        }
        completion(.success(halls))
    }
}
