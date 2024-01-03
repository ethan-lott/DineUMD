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
//        print("successfully called download function")
//        // Create a storage reference
//        let storageRef = storage.reference().child("/menuFolder/diningMenus.json")
//        
//        // Create local filesystem URL
////        let localURL = URL(string: "DineUMD/diningMenus.json")!
//        
//        // Download to the local filesystem
//        storageRef.getData(maxSize: 5*1024*1024) { data, error in
//          if let error = error {
//            // Uh-oh, an error occurred!
//              print(error)
//          } else {
//            // Local file URL is returned
//              do {
//                  let jsonArray = try JSONSerialization.jsonObject(with: data.unsafelyUnwrapped)
//                  print(jsonArray[0])
//              }
//              catch {
//                  print("fail")
//              }
//          }
//        }
    }
}
