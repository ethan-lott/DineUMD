//
//  Item.swift
//  DineUMD
//
//  Created by Ethan Jacob Lott on 11/9/23.
//

import Foundation
import SwiftUI
import CoreLocation

struct Item: Hashable, Codable {
//    var id: Int
    var name: String
//    var description: String
//    var isFavorite: Bool
    var restrictions: [String]
    
//    private var imageName: String
//    var image: Image {
//        Image(imageName)
//    }
}
