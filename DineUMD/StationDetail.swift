//
//  StationDetail.swift
//  DineUMD
//
//  Created by Ethan Jacob Lott on 12/7/23.
//

import SwiftUI

struct StationDetail: View {
    @Environment(DiningData.self) var diningData
    var station: Station
    var meal: Meal
    var stationIndex: Int {
        meal.stations.firstIndex(where: { $0.id == station.id })!
    }
    
    var body: some View {
        NavigationSplitView {
            List(station.items) {item in
                NavigationLink {
                    ItemDetail(item: item, station: station)
                } label: {
                    Text(item.name)
//                      StationRow(station: station)
                }
            }
        } detail: {
            Text("Select a Menu Item")
        }
        .navigationTitle(station.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let diningData = DiningData()
    return StationDetail(station: diningData.menuDates[0].halls[1].meals[0].stations[0], meal: diningData.menuDates[0].halls[1].meals[0])
        .environment(diningData)
}
