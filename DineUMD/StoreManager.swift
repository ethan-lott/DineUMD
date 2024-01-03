//
//  StoreManager.swift
//  DineUMD
//
//  Created by Jason Lott on 1/3/24.
//

import Foundation
import FirebaseStorage

class StorageManager: ObservableObject {
    let storage = Storage.storage()
    
    func downloadMenus() {
        print("successfully called dowload function")
        // Create a storage reference
        let storageRef = storage.reference().child("gs://dineumd.appspot.com/menuFolder/diningMenus.json")
        
        // Create local filesystem URL
        let localURL = URL(string: "DineUMD/diningMenus.json")!
        
        // Download to the local filesystem
        _ = storageRef.write(toFile: localURL) { url, error in
          if let error = error {
            // Uh-oh, an error occurred!
              print(error)
          } else {
            // Local file URL is returned
              print("lowkey worked")
          }
        }
    }
}
