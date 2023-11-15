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
    var mealID: Int
    
    @State private var date = Date()
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .day, value: 0, to: Date())!
        let max = Calendar.current.date(byAdding: .day, value: 6, to: Date())!
        return min...max
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading){
                
                HStack {
                    Text(diningHall.name)
                        .font(.title)
                    
                    DatePicker(
                        "",
                        selection: $date,
                        in: dateRange,
                        displayedComponents: [.date]
                    )
                }
                

                Divider()
                
                Text(diningHall.meals[mealID].stations[0].name)
                Text(diningHall.meals[mealID].stations[1].name)
                if (diningHall.meals[mealID].stations.count > 2) {
                    Text(diningHall.meals[mealID].stations[2].name)
                    Text(diningHall.meals[mealID].stations[3].name)
                    Text(diningHall.meals[mealID].stations[4].name)
                    Text(diningHall.meals[mealID].stations[5].name)
                }
                
            }
            .padding()
        }
        .navigationTitle(diningHall.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let diningData = DiningData()
    return MealDetail(diningHall: diningData.diningHalls[2], mealID: 0)
        .environment(diningData)
}
