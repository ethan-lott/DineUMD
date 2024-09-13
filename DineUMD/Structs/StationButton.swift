//
//  StationButton.swift
//  DineUMD
//
//  Created by Ethan Lott on 9/12/24.
//

import SwiftUI

struct StationButton: View {
    var station: Station
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 2) {
                Circle().fill(.green).frame(width: 10)
                Rectangle()
                    .opacity(0.001)
                    .frame(width: geometry.size.width)
            }
        }
    }
}

//#Preview {
    //StationButton()
//}
