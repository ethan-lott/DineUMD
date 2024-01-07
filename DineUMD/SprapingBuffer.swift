//
//  SprapingBuffer.swift
//  DineUMD
//
//  Created by Jason Lott on 1/6/24.
//

import SwiftUI

struct SprapingBuffer: View {
    @State private var isScraping = true
    
    var body: some View {
        return Group {
            if isScraping {
                ProgressView("Finding this week's menus").task {
                    let ms = MenuScraper()
                    ms.getData() { result in
                        switch result {
                        case .success(let data):
                            isScraping = false
                            ms.writeToJSONFile(data: data)
                        case .failure(let error):
                            print("Error: \(error.localizedDescription)")
                        }
                    }
                }
            } else {
                ContentView().environmentObject(DiningData())
            }
        }
    }
}

#Preview {
    SprapingBuffer()
}
