//
//  DiningHallList.swift
//  DineUMD
//
//  Created by Ethan Jacob Lott on 11/9/23.
//

import SwiftUI

struct MenuDateDetail: View {
    @Environment(DiningData.self) var diningData
    @State var menuDate: MenuDate
    var menuDateIndex: Int {
        diningData.menuDates.firstIndex(where: { $0.id == menuDate.id })!
    }
    
    @State private var showingDatePicker = false
    @State var selectedDateIdx: Int? = nil
    @State var selectedMealIdx: Int? = nil
    
    
    
    func setDateIdx(newIdx: Int) {
        selectedDateIdx = newIdx
    }
    
    func setMealIdx(newIdx: Int) {
        selectedMealIdx = newIdx
    }
    
    func decideMeal(date: MenuDate, hall: DiningHall, selectedMealIdx: Int?) -> Meal? {
        let num_meals = hall.meals.count
        if num_meals == 0 {
            return nil
        }
        
        var meal_idx = 0
        
        if selectedMealIdx != nil {
            if num_meals == 3 {
                meal_idx = selectedMealIdx!
            } else {
                if selectedMealIdx! <= 1 {
                    meal_idx = 0
                } else {
                    meal_idx = 1
                }
            }
        } else {
            // Create a calendar instance
            let calendar = Calendar.current
            
            // Extract components from the current date
            let components = calendar.dateComponents([.hour, .minute], from: Date())
            if let hour = components.hour, let minute = components.minute {
                let time_mins = hour * 60 + minute
                // if before 9:30 set meal to breakfast or brunch
                if time_mins <= 570 {
                    meal_idx = 0
                }
                // if before 14:00 and after 9:30 set meal to lunch or brunch
                else if time_mins <= 840 {
                    if num_meals == 3 {
                        meal_idx = 1
                    } else {
                        meal_idx = 0
                    }
                }
                // if after 14:00 set meal to dinner
                else {
                    if num_meals == 3 {
                        meal_idx = 2
                    } else {
                        meal_idx = 1
                    }
                }
            }
        }
        return hall.meals[meal_idx]
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                ForEach(menuDate.halls) { diningHall in
                    NavigationLink {
                        if let meal = decideMeal(date: menuDate, hall: diningHall, selectedMealIdx: selectedMealIdx) {
                            DiningHallDetail(diningHall: diningHall, menuDate: menuDate, meal: meal)
                        } else {
                            Text(diningHall.name + " is closed today.")
                        }
                    } label: {
                        DiningHallRow(diningHall: diningHall)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    HStack(spacing: 0) {
                        Text("Dine ")
                        Button(action: {
                            showingDatePicker.toggle()
                        }) {
                            Text("Now")
                                .foregroundColor(.primary)
                        }
                        .popover(isPresented: $showingDatePicker) {
                            let _ = setDateIdx(newIdx: 0)
                            let _ = setMealIdx(newIdx: 0)
                            datePickerView(selectedDateIdx: $selectedDateIdx, selectedMealIdx: $selectedMealIdx)
                                .onDisappear() {
                                    let _ = print(selectedDateIdx!)
                                    let _ = print(selectedMealIdx!)
                                }
                        }
                    }
                    .font(.headline) // Customize the font to match the navigation title style
                }
            }
        }
    }
}

#Preview {
    MenuDateDetail(menuDate: DiningData().menuDates[0])
        .environment(DiningData())
}
