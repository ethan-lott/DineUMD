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
    var name: String
    var restrictions: [String]
}
