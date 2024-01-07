//
//  test.swift
//  DineUMD
//
//  Created by Jason Lott on 1/6/24.
//

import SwiftUI

struct test: View {
    @State private var isLoading = true // Set to true to initially show the spinner

    var body: some View {
        VStack {
            if isLoading {
                ProgressView("Loading...")
                    .onAppear {
                        // Simulate an asynchronous operation
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            // Set isLoading to false when the asynchronous operation is complete
                            self.isLoading = false
                        }
                    }
            } else {
                Text("Content goes here")
            }
        }
    }
}

#Preview {
    test()
}
