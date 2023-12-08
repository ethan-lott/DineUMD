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
                }
                
                Divider()
                NavigationSplitView {
                    List {
                        ForEach(diningHall.meals[mealID].stations) { station in
                            NavigationLink {
                                StationDetail(station: station)
                            } label: {
                                StationRow(station: station)
                            }
                        }
                    }
                } detail: {
                    Text("Select a Station")
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
    return MealDetail(diningHall: diningData.menuDates[0].halls[2], mealID: 0)
        .environment(diningData)
}
