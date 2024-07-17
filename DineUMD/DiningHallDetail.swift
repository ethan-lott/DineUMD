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
    
    var body: some View {
        @Bindable var diningData = diningData
        
//        TabView {
//            if (diningHall.meals.count > 0) {
//                MealDetail(diningHall: diningHall, meal: diningHall.meals[0])
//                    .tabItem {
//                        Label(diningHall.meals[0].name, systemImage: "sunrise")
//                    }
//                
//                if (diningHall.meals.count > 1) {
//                    MealDetail(diningHall: diningHall, meal: diningHall.meals[1])
//                        .tabItem {
//                            Label(diningHall.meals[1].name, systemImage: "sun.max")
//                        }
//                    
//                    if (diningHall.meals.count > 2) {
//                        MealDetail(diningHall: diningHall, meal: diningHall.meals[2])
//                            .tabItem {
//                                Label(diningHall.meals[2].name, systemImage: "sunset")
//                            }
//                    }
//                }
//            }
//        }
        NavigationSplitView {
            List {
                ForEach(diningHall.meals) { meal in
                    NavigationLink {
                        MealDetail(diningHall: diningHall, meal: meal)
                    } label: {
                        Text(meal.name)
                    }
                }
            }
            .navigationTitle("Meals")
        } detail: {
            Text("Select a Meal")
        }
        .navigationTitle(diningHall.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let diningData = DiningData()
    return DiningHallDetail(diningHall: diningData.menuDates[0].halls[1], menuDate: diningData.menuDates[0])
        .environment(diningData)
}
