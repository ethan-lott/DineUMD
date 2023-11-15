//
//  DiningHallList.swift
//  DineUMD
//
//  Created by Ethan Jacob Lott on 11/9/23.
//

import SwiftUI

struct DiningHallList: View {
    @Environment(DiningData.self) var diningData
    
    var body: some View {
        NavigationSplitView {
            List {
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
