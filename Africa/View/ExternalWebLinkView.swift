//
//  ExternalWebLinkView.swift
//  Africa
//
//  Created by p0nyqz on 05.07.2022.
//

import SwiftUI

struct ExternalWebLinkView: View {
    
    // MARK: - PROPERTIES
    
    let animal: Animal
    
    var body: some View {
        
        // MARK: - BODY
        
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                
                Group {
                    Image(systemName: "arrow.up.right.square")
                    
                    Link(animal.name, destination: (URL(string: animal.link) ?? URL(string: "https://wikipedia.org"))!)
                }
                .foregroundColor(.accentColor)
            } //: HSTACK
        } //: BOX
    }
}

// MARK: - PREVIEW

struct ExternalWebLinkView_Previews: PreviewProvider {
    
    static let animals: [Animal] = Bundle.main.decode("animals.jsonan")
    
    static var previews: some View {
        ExternalWebLinkView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
