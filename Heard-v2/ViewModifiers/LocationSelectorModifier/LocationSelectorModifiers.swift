//
//  LocationSelectorModifiers.swift
//  Heard-v2
//
//  Created by Zachary Walsh on 1/17/22.
//

import SwiftUI

struct locationButtonSytling: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 400, height: 400, alignment: .center)
            .background(Color.lightGray)
            .cornerRadius(30)
            .foregroundColor(.FontBlue)
            .font(.system(size: 60))
    }
}

extension View{
    func LocationButton() -> some View {
        modifier(locationButtonSytling())
    }
}
