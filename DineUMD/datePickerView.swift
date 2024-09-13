//
//  datePickerView.swift
//  DineUMD
//
//  Created by Jason Samuel Lott on 7/25/24.
//

import SwiftUI

struct datePickerView: View {
    @Binding var selectedDateIdx: Int?
    @Binding var selectedMealIdx: Int?
    
    @State var selectedDate: Date = Date()
    private let oneWeekFromNow = Calendar.current.date(byAdding: .day, value: 6, to: Date())!
    private let meals = ["Breakfast","Lunch","Dinner"]
    
    var body: some View {
        VStack {
            Text("Choose a new date and meal")
            DatePicker("", selection: $selectedDate, in: Date()...oneWeekFromNow, displayedComponents: [.date])
                .datePickerStyle(GraphicalDatePickerStyle())
                .onReceive([selectedDate].publisher.first(), perform: { _ in
                    let selectedDateIdx = Calendar.current.dateComponents([.day], from: Date(), to: selectedDate).day
                })
                .padding()
            Picker("Meal", selection: $selectedMealIdx) {
                ForEach(0..<meals.count, id: \.self) {
                    Text(meals[$0])
                        .tag($0)
                }
            }
            .pickerStyle(.segmented)
            .padding()        }
    }
}

#Preview {
    datePickerView(selectedDateIdx: .constant(0), selectedMealIdx: .constant(0))
}

