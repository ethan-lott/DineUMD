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
        diningData.diningHalls.firstIndex(where: { $0.id == diningHall.id })!
    }
    
    var body: some View {
        @Bindable var diningData = diningData
        let threeMeals = (diningHall.meals.count == 3)
        
        TabView {
            MealDetail(diningHall: diningHall, mealID: 0)
                .tabItem {
                    Label(diningHall.meals[0].name, systemImage: "sunrise")
                }
            MealDetail(diningHall: diningHall, mealID: 1)
                .tabItem {
                    Label(diningHall.meals[1].name, systemImage: threeMeals ? "sun.max" : "sunset")
                }
            if (threeMeals) {
                MealDetail(diningHall: diningHall, mealID: 2)
                    .tabItem {
                        Label(diningHall.meals[2].name, systemImage: "sunset")
                    }
            }
        }

    }
}

#Preview {
    let diningData = DiningData()
    return DiningHallDetail(diningHall: diningData.diningHalls[2])
        .environment(diningData)
}
