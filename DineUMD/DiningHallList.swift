//
//  DiningHallList.swift
//  DineUMD
//
//  Created by Ethan Jacob Lott on 11/9/23.
//

import SwiftUI

struct DiningHallList: View {
    @Environment(DiningData.self) var diningData
//    @State private var showFavoritesOnly = false
    
//    var filteredDiningHalls: [DiningHall] {
//        modelData.diningHalls.filter { diningHall in
//            (!showFavoritesOnly || diningHall.isFavorite)
//        }
//    }
    
    var body: some View {
        NavigationSplitView {
            List {
//                Toggle(isOn: $showFavoritesOnly) {
//                    Text("Favorites only")
//                }
                
                ForEach(diningData.diningHalls) { diningHall in
                    NavigationLink {
                        DiningHallDetail(diningHall: diningHall)
                    } label: {
                        DiningHallRow(diningHall: diningHall)
                    }
                }
            }
            .navigationTitle("Dining Halls")
        } detail: {
            Text("Select a Dining Hall")
        }
    }
}

#Preview {
    DiningHallList()
        .environment(DiningData())
}
