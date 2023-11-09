//
//  DiningHallDetail.swift
//  DineUMD
//
//  Created by Ethan Jacob Lott on 11/9/23.
//

import SwiftUI

struct DiningHallDetail: View {
    @Environment(DiningData.self) var diningData
    var diningHall: DiningHall
    
    var diningHallIndex: Int {
        diningData.diningHalls.firstIndex(where: { $0.id == diningHall.id })!
    }
    
    var body: some View {
        @Bindable var diningData = diningData
        
        ScrollView {
//            MapView(coordinate: landmark.locationCoordinate)
//                .frame(height: 300)
            
//            CircleImage(image: landmark.image)
//                .offset(y: -130)
//                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                HStack{
                    Text(diningHall.name)
                        .font(.title)
                    
//                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }

                
                Divider()
                HStack {
                    Button {
                        
                    } label: {
                        Text("Breakfast")
                    }
                    Spacer()
                    Button {
                        
                    } label: {
                        Text("Lunch")
                    }
                    Spacer()
                    Button {
                        
                    } label: {
                        Text("Dinner")
                    }
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .padding()
                Divider()
                
                Text(diningHall.meals[1].stations[0].name)
                Text(diningHall.meals[1].stations[1].name)
                Text(diningHall.meals[1].stations[2].name)
                Text(diningHall.meals[1].stations[3].name)
                Text(diningHall.meals[1].stations[4].name)
                Text(diningHall.meals[1].stations[5].name)
                Text(diningHall.meals[1].stations[6].name)
                Text(diningHall.meals[1].stations[7].name)
                Text(diningHall.meals[1].stations[8].name)
                Text(diningHall.meals[1].stations[9].name)
//                List {
    //                Toggle(isOn: $showFavoritesOnly) {
    //                    Text("Favorites only")
    //                }
                    
//                    ForEach(diningHall.meals[0].stations) { station in
//                        NavigationLink {
//                            DiningHallDetail(diningHall: diningHall)
//                        } label: {
//                            DiningHallRow(diningHall: diningHall)
//                        }
//                    }
//                }
            }
            .padding()
        }
        .navigationTitle(diningHall.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let diningData = DiningData()
    return DiningHallDetail(diningHall: diningData.diningHalls[2])
        .environment(diningData)
}
