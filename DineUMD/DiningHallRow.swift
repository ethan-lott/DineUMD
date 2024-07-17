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
            //            diningHall.image
            //                .resizable()
            //                .frame(width:50, height:50)
            Spacer()
            Button(diningHall.name, action: {})
                .buttonStyle(.borderedProminent)
                .tint(.red)
                .controlSize(.large)
            //            if diningHall.isFavorite {
            //                Image(systemName: "star.fill")
            //                    .foregroundStyle(.yellow)
            //            }
            
            Spacer()
        }
    }
}

#Preview {
    let diningHalls = DiningData().menuDates[0].halls
    return Group {
        DiningHallRow(diningHall: diningHalls[0])
        DiningHallRow(diningHall: diningHalls[1])
        DiningHallRow(diningHall: diningHalls[2])
    }
}
