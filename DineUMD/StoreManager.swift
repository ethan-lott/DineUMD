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
//        storageRef.getDownloadURL()
//          .then(url => fetch(url))
//          .then(response => response.json())
//          .then(data => localStorage.setItem("data", JSON.stringify(data)));
    }
}
