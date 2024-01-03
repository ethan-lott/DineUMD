//
//  Item.swift
//  DineUMD
//
//  Created by Ethan Jacob Lott on 11/9/23.
//

import Foundation
import SwiftUI
import CoreLocation

struct Item: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var restrictions: [String]
}
