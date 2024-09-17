//
//  StationDetail.swift
//  DineUMD
//
//  Created by Ethan Jacob Lott on 12/7/23.
//

import SwiftUI

struct StationDetail: View {
    @Environment(DiningData.self) var diningData
    var stationList: [Station]
    var meal: Meal
    var stationIndeces: [Int] = [meal.stations.firstIndex(where: { $0.id == station.id })! for station in stationList]
    
    var body: some View {
        var itemList: [Item] = []
        for station in stationList {
            stationIndeces.append(meal.stations.firstIndex(where: { $0.id == station.id })!)
            itemList += station.items
        }
        NavigationStack {
            List(itemList) {item in
                NavigationLink {
                    ItemDetail(item: item, station: item.station)
                } label: {
                    Text(item.name)
                }
            }
            .navigationTitle(stationList[0].name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    let diningData = DiningData()
    return StationDetail(stationList: [diningData.menuDates[0].halls[1].meals[0].stations[0]], meal: diningData.menuDates[0].halls[1].meals[0])
        .environment(diningData)
}
