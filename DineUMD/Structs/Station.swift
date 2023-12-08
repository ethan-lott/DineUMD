//
//  Station.swift
//  DineUMD
//
//  Created by Ethan Jacob Lott on 11/9/23.
//

import Foundation
import SwiftUI
import CoreLocation

struct Station: Hashable, Codable, Identifiable {
    var name: String
    var id: Int
    var items: [Item]
}
