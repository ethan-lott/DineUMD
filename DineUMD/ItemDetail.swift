//
//  ItemDetail.swift
//  DineUMD
//
//  Created by Ethan Lott on 1/3/24.
//

import SwiftUI

struct ItemDetail: View {
    @Environment(DiningData.self) var diningData
    var item: Item
    var station: Station
    
    var body: some View {
        Text(item.name)
    }
}

#Preview {
    let diningData = DiningData()
    return StationDetail(station: diningData.menuDates[0].halls[0].meals[0].stations[0], meal: diningData.menuDates[0].halls[0].meals[0])
        .environment(diningData)
}
