//
//  StationRow.swift
//  DineUMD
//
//  Created by Ethan Jacob Lott on 12/7/23.
//

import SwiftUI

struct StationRow: View {
    var station: Station
    
    var body: some View {
        HStack {
            Text(station.name)
            Spacer()
        }
    }
}

#Preview {
    let stations = DiningData().menuDates[0].halls[1].meals[0].stations
    return Group {
        StationRow(station: stations[0])
        StationRow(station: stations[1])
    }
}
