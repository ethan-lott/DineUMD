//
//  datePickerView.swift
//  DineUMD
//
//  Created by Jason Samuel Lott on 7/25/24.
//

import SwiftUI

struct datePickerView: View {
    @Binding var selectedDate: Date
    private let oneWeekFromNow = Calendar.current.date(byAdding: .day, value: 6, to: Date())!
    @Binding var selectedMeal: Int
    private let meals = ["Breakfast","Lunch","Dinner"]
    
    var body: some View {
        VStack {
            Text("Choose a new date and meal")
            DatePicker("", selection: $selectedDate, in: Date()...oneWeekFromNow, displayedComponents: [.date])
                .datePickerStyle(GraphicalDatePickerStyle())
                .padding()
            Picker("Meal", selection: $selectedMeal) {
                ForEach(meals, id: \.self) { meal in
                    Text(meal)
                }
            }
            .pickerStyle(.segmented)
            .padding()
        }
    }
}

#Preview {
    datePickerView(selectedDate: .constant(Date()), selectedMeal: .constant(0))
}

