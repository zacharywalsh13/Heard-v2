//
//  LocationSelectorModifiers.swift
//  Heard-v2
//
//  Created by Zachary Walsh on 1/17/22.
//

import SwiftUI

struct locationButtonSytling: ViewModifier {
    var size: CGFloat {
            if UIDevice.current.userInterfaceIdiom == .phone {
                return 400 * 0.75
            } else {
                return 400
            }
        }
    var font: CGFloat {
            if UIDevice.current.userInterfaceIdiom == .phone {
                return 60 * 0.75
            } else {
                return 60 
            }
        }
    var CRadius: CGFloat {
            if UIDevice.current.userInterfaceIdiom == .phone {
                return 30 * 0.7
            } else {
                return 30
            }
        }
    func body(content: Content) -> some View {
        content
            .frame(width: size, height: size, alignment: .center)
            .background(Color.lightGray)
            .cornerRadius(CRadius)
            .foregroundColor(.FontBlue)
            .font(.system(size: font))
    }
}

extension View{
    func LocationButton() -> some View {
        modifier(locationButtonSytling())
    }
}
