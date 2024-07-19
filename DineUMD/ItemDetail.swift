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
        NavigationSplitView {
            Text(item.restrictions.description)
        } detail: {
            Text("Item restrictions.")
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let diningData = DiningData()
    return ItemDetail(item: diningData.menuDates[0].halls[1].meals[0].stations[0].items[1], station: diningData.menuDates[0].halls[1].meals[0].stations[0])
        .environment(diningData)
}
