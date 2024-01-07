//
//  ContentView.swift
//  DineUMD
//
//  Created by Ethan Jacob Lott on 11/9/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MenuDateList()
    }
}

#Preview {
    MenuDateList()
        .environment(DiningData())
}
