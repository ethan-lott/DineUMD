//
//  DiningHallList.swift
//  DineUMD
//
//  Created by Ethan Jacob Lott on 11/9/23.
//

import SwiftUI

struct DiningHallList: View {
    @Environment(DiningData.self) var diningData
    var menuDate: MenuDate
    var menuDateIndex: Int {
        diningData.menuDates.firstIndex(where: { $0.id == menuDate.id })!
    }
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(menuDate.halls) { diningHall in
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
    DiningHallList(menuDate: DiningData().menuDates[0])
        .environment(DiningData())
}
