//
//  DiningHallRow.swift
//  DineUMD
//
//  Created by Ethan Jacob Lott on 11/9/23.
//

import SwiftUI

struct DiningHallRow: View {
    var diningHall: DiningHall
    
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .fill(.red)
                Text(diningHall.name)
                    .tint(.black)
                    .controlSize(.large)
            }
            Spacer()
        }
    }
}

#Preview {
    let diningHalls = DiningData().menuDates[0].halls
    return Group {
        DiningHallRow(diningHall: diningHalls[1])
        DiningHallRow(diningHall: diningHalls[2])
    }
}
