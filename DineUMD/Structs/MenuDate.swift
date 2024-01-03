//
//  MenuDate.swift
//  DineUMD
//
//  Created by Ethan Jacob Lott on 12/7/23.
//

import Foundation

struct MenuDate: Hashable, Codable, Identifiable {
    var date: String
    var id: Int
    var halls: [DiningHall]
}
