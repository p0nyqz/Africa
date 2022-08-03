//
//  CenterModifier.swift
//  Africa
//
//  Created by p0nyqz on 03.08.2022.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
