//
//  MealDetail.swift
//  DineUMD
//
//  Created by Ethan Jacob Lott on 11/14/23.
//

import SwiftUI

struct MealDetail: View {
    @Environment(DiningData.self) var diningData
    var diningHall: DiningHall
    var meal: Meal
    var mealIndex: Int {
        diningHall.meals.firstIndex(where: { $0.id == meal.id })!
    }
    
    @State private var date = Date()
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .day, value: 0, to: Date())!
        let max = Calendar.current.date(byAdding: .day, value: 6, to: Date())!
        return min...max
    }
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(meal.stations) { station in
                    NavigationLink {
                        StationDetail(station: station, meal: meal)
                    } label: {
                        Text(station.name)
//                        StationRow(station: station)
                    }
                }
            }
            .navigationTitle("Stations")
        } detail: {
            Text("Select a Station")
        }
        .navigationTitle(meal.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let diningData = DiningData()
    return MealDetail(diningHall: diningData.menuDates[0].halls[0], meal: diningData.menuDates[0].halls[0].meals[0])
        .environment(diningData)
}
