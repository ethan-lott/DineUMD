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
                        //LandmarkDetail(landmark: landmark)
                    } label: {
                        DiningHallRow(diningHall: diningHall)
                    }
                }
            }
            .navigationTitle("Landmarks")
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    DiningHallList()
        .environment(DiningData())
}
