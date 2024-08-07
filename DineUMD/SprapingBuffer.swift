//
//  SprapingBuffer.swift
//  DineUMD
//
//  Created by Jason Lott on 1/6/24.
//

import SwiftUI

func saveMenu() {
    let ms = MenuScraper()
    ms.getData() { result in
        switch result {
        case .success(let data):
            ms.writeToJSONFile(data: data)
        case .failure(let error):
            print("Error: \(error.localizedDescription)")
        }
    }
}

struct SprapingBuffer: View {
    @State private var isScraping = true

    var body: some View {
        return Group {
            if isScraping {
                ProgressView("Finding this week's menus").task {
                    if let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                        // Create a file URL for the specified file in the document directory
                        let fileURL = documentsDirectory.appendingPathComponent("diningMenus.json")
                        
                        do {
                            // Get the file attributes
                            if FileManager.default.fileExists(atPath: fileURL.path) {
                                let fileAttributes = try FileManager.default.attributesOfItem(atPath: fileURL.path)
                                
                                if let modificationDate = fileAttributes[.modificationDate] as? Date {
                                    if Calendar.current.isDateInToday(modificationDate) {
                                        print("The menu was updated today.")
                                        isScraping = false
                                    } else {
                                        print("The menu was not updated today.")
                                        saveMenu()
                                        isScraping = false
                                        }
                                    }
                            } else {
                                saveMenu()
                                isScraping = false
                            }
                        } catch {
                            print("Error getting file metadata: \(error)")
                        }
                    }
                }
            } else {
//                ContentView().environmentObject(DiningData())
                MenuDateDetail(menuDate: DiningData().menuDates[0])
                    .environment(DiningData())
            }
        }
    }
}

#Preview {
    SprapingBuffer()
}
