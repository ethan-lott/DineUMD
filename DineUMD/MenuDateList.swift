//
//  MenuDateList.swift
//  DineUMD
//
//  Created by Ethan Jacob Lott on 12/7/23.
//

import SwiftUI

struct MenuDateList: View {
    @Environment(DiningData.self) var diningData
    
    var body: some View {
        
        NavigationSplitView {
            List {
                ForEach(diningData.menuDates) { menuDate in
                    NavigationLink {
                        MenuDateDetail(menuDate: menuDate)
                    } label: {
                        Text(menuDate.date)
                    }
                }
            }
            .navigationTitle("Dates")
        } detail: {
            Text("Select a Dining Hall")
        }
    }
}

#Preview {
    MenuDateList()
        .environment(DiningData())
}
