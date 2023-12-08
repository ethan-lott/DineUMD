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
    var stationIndex: Int {
        diningData.menuDates[0].halls[0].meals[0].stations.firstIndex(where: { $0.id == station.id })!
    }
    
    var body: some View {
        @Bindable var diningData = diningData
        Text(station.name)
            .font(.title)

    }
}

#Preview {
    let diningData = DiningData()
    return StationDetail(station: diningData.menuDates[0].halls[0].meals[0].stations[0])
        .environment(diningData)
}
