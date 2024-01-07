//
//  DineUMDApp.swift
//  DineUMD
//
//  Created by Ethan Jacob Lott on 11/9/23.
//

import SwiftUI
import Firebase

@main
struct DineUMDApp: App {
    init() {
//        FirebaseApp.configure()
//        let sm = StorageManager()
//        sm.downloadMenus()
        let ms = MenuScraper()
        ms.getData()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(DiningData())
        }
    }
}
