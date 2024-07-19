//
//  ContentView.swift
//  DineUMD
//
//  Created by Ethan Jacob Lott on 11/9/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(DiningData.self) var diningData
    
    var body: some View {
        MenuDateDetail(menuDate: diningData.menuDates[0])
    }
}

#Preview {
    MenuDateDetail(menuDate: DiningData().menuDates[0])
        .environment(DiningData())
}
