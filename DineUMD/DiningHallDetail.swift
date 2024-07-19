//
//  DiningHallDetail.swift
//  DineUMD
//
//  Created by Ethan Jacob Lott on 11/9/23.
//

import SwiftUI

struct DiningHallDetail: View {
    @Environment(DiningData.self) var diningData
    var diningHall: DiningHall
    var diningHallIndex: Int {
        diningData.menuDates[0].halls.firstIndex(where: { $0.id == diningHall.id })!
    }
    var menuDate: MenuDate
    var meal: Meal
    
    var buttonProportions: Dictionary<String, Dictionary<String, Dictionary<String, CGFloat>>> = [
        "Yahentamitsi": [
            "Sprouts": ["w": 0.07, "h": 0.055, "x": 0.165, "y": 0.465],
            "Good Food Gluten Free": ["w": 0.098, "h": 0.095, "x": 0.179, "y": 0.565],
            "Terp Comfort": ["w": 0.076, "h": 0.11, "x": 0.253, "y": 0.398],
            "Mezza": ["w": 0.07, "h": 0.086, "x": 0.285, "y": 0.686],
            "Chef's Corner": ["w": 0.068, "h": 0.095, "x": 0.375, "y": 0.435],
            "Maryland Bakery": ["w": 0.08, "h": 0.041, "x": 0.455, "y": 0.81],
            "Salad Bar": ["w": 0.074, "h": 0.041, "x": 0.55, "y": 0.628],
            "Woks": ["w": 0.072, "h": 0.075, "x": 0.766, "y": 0.364],
            "Breakfast": ["w": 0.085, "h": 0.075, "x": 0.818, "y": 0.72],
            "Joe's Grill": ["w": 0.105, "h": 0.094, "x": 0.825, "y": 0.174]
        ],
        "South Campus": [
            "Broiler Works": ["w": 0.125, "h": 0.045, "x": 0.4, "y": 0.438],
            "Grill Works": ["w": 0.075, "h": 0.07, "x": 0.425, "y": 0.505],
            "Roaster": ["w": 0.085, "h": 0.045, "x": 0.42, "y": 0.667],
            "Chef's Table": ["w": 0.075, "h": 0.07, "x": 0.425, "y": 0.588],
            "Pasta": ["w": 0.07, "h": 0.055, "x": 0.165, "y": 0.465],
            "Pizza": ["w": 0.07, "h": 0.045, "x": 0.43, "y": 0.258],
            "Salad Bar": ["w": 0.058, "h": 0.06, "x": 0.307, "y": 0.673],
            "Treats": ["w": 0.07, "h": 0.045, "x": 0.195, "y": 0.415],
            "Waffle, Doughnut, Bagel Bar": ["w": 0.07, "h": 0.055, "x": 0.165, "y": 0.465],
            //"Soup Du Jour": ["w": 0.07, "h": 0.055, "x": 0.165, "y": 0.465],
            "Deli+": ["w": 0.062, "h": 0.045, "x": 0.19, "y": 0.507],
            "Deli": ["w": 0.05, "h": 0.045, "x": 0.185, "y": 0.59],
            "Purple Zone": ["w": 0.07, "h": 0.055, "x": 0.165, "y": 0.465],
            "Roma Vegan Salads and Panini": ["w": 0.134, "h": 0.095, "x": 0.615, "y": 0.295],
            "Vegan Desserts": ["w": 0.07, "h": 0.055, "x": 0.165, "y": 0.465],
            "Mongolian Grill": ["w": 0.07, "h": 0.055, "x": 0.65, "y": 0.465]
        ],
        "251 North": [
            "": [:]
        ]
    ]
    
    
    private func stationButtons() -> some View {
        GeometryReader { proxy in
            let w = proxy.size.width
            let h = proxy.size.height
            ZStack {
                ForEach(meal.stations) { station in
                    if (buttonProportions[diningHall.name]!.keys.contains(station.name)) {
                        NavigationLink {
                            StationDetail(station: station, meal: meal)
                        } label: {
                            Rectangle().opacity(0.1)
                        }
                        .frame(
                            width: w * buttonProportions[diningHall.name]![station.name]!["w"]!,
                            height: h * buttonProportions[diningHall.name]![station.name]!["h"]!)
                        .position(
                            x: w * buttonProportions[diningHall.name]![station.name]!["x"]!,
                            y: h * buttonProportions[diningHall.name]![station.name]!["y"]!)
                    }
                }
            }
        }
    }
    
    var body: some View {
        @Bindable var diningData = diningData
        let bp: String = (diningHall.name == "Yahentamitsi") ? "Y_bp" : ((diningHall.name == "251 North") ? "North_bp" : "SC_bp")
        
//        NavigationSplitView {
//            List {
//                ForEach(diningHall.meals) { meal in
//                    NavigationLink {
//                        MealDetail(diningHall: diningHall, meal: meal)
//                    } label: {
//                        Text(meal.name)
//                    }
//                }
//            }
//            .navigationTitle("Meals")
//        } detail: {
//            Text("Select a Meal")
//        }
//        .navigationTitle(diningHall.name)
//        .navigationBarTitleDisplayMode(.inline)
        
        NavigationSplitView {
            VStack {
                ScrollView(.horizontal) {
                    Image(bp)
                        .resizable()
                        .scaledToFit()
                        .overlay(stationButtons())
                }
            }
        } detail: {
            Text("Select a station.")
        }
        .navigationTitle(diningHall.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let diningData = DiningData()
    return DiningHallDetail(diningHall: diningData.menuDates[0].halls[1], menuDate: diningData.menuDates[0], meal: diningData.menuDates[0].halls[1].meals[1])
        .environment(diningData)
}
