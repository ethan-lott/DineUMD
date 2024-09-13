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
        HStack {
            Circle().fill(.green).frame(width: 10)
            Rectangle().opacity(0.001)
        }
    }
}

//#Preview {
    //StationButton()
//}
