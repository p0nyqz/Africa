//
//  GalleryView.swift
//  Africa
//
//  Created by p0nyqz on 02.06.2022.
//

import SwiftUI

struct GalleryView: View {
    // MARK: - PROPERTIES
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    
    // SIMPLE GRID DEFINITION
    let gridLayout:[GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    // MARK: - BODY
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            // MARK: - GRID
            
            LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                ForEach(animals) { item in
                    Image(item.image)
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 1))
                }//: LOOP
            }//: GRID
        } //: SCROLL
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

// MARK: - PREVIEW

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
