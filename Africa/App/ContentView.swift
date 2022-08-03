//
//  ContentView.swift
//  Africa
//
//  Created by p0nyqz on 01.06.2022.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    @State private var isGridViewActivate: Bool = false
    
    @State private var gridLayout: [GridItem] = [ GridItem(.flexible()) ]
    @State private var gridColumn: Int = 1
    @State private var toolbarIcon: String = "square.grid.2x2"
    
    // MARK: - FUNCTIONS
    
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        print("Grid Number: \(gridColumn)")
    }
    
    
    var body: some View {
        // MARK: - BODY
        
        NavigationView {
            Group {
                NavigationView {
                    if !isGridViewActivate {
                        List {
                            CoverImageView()
                                .frame(height: 300)
                                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                            
                            ForEach(animals) {animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                    AnimalListItemView(animal: animal)
                                } //: CONDITION
                            } //: LOOP
                        } //: LIST
                    } else {
                        ScrollView(.vertical, showsIndicators: false) {
                            LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                                ForEach(animals) { animal in
                                    NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                        AnimalGridItemView(animal: animal)
                                    }
                                } //: LOOP
                            } //: GRID
                            .padding(10)
                            .animation(.easeIn)
                        } //: SCROLL
                    } //: LIST
            } //: GROUP
        }
            
            .navigationBarTitle("Africa", displayMode: .large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16) {
                        // LIST
                        Button(action: {
                            print("List view is activated")
                            isGridViewActivate = false
                            haptics.impactOccurred()
                        }) {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActivate ? .primary : .accentColor)
                        }
                        // GRID
                        Button(action: {
                            print("Grid view is activated")
                            isGridViewActivate = true
                            haptics.impactOccurred()
                            gridSwitch()
                        }) {
                            Image(systemName: "square.grid.2x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActivate ? .accentColor : .primary)
                        }
                    } //: HSTACK
                } //: BUTTONS
            } //: TOOLBAR
        } //: NAVIGATION
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
