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
        HStack {
//            diningHall.image
//                .resizable()
//                .frame(width:50, height:50)
            Text(diningHall.name)
            
            Spacer()
            
//            if diningHall.isFavorite {
//                Image(systemName: "star.fill")
//                    .foregroundStyle(.yellow)
//            }
        }
    }
}

#Preview {
    let diningHalls = DiningData().diningHalls
    return Group {
        DiningHallRow(diningHall: diningHalls[0])
        DiningHallRow(diningHall: diningHalls[1])
    }
}
