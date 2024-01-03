//
//  DineUMDApp.swift
//  DineUMD
//
//  Created by Ethan Jacob Lott on 11/9/23.
//

import SwiftUI

@main
struct DineUMDApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(DiningData())
        }
    }
}
