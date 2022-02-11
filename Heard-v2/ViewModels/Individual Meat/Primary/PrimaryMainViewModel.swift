//
//  File.swift
//  Heard-v2
//
//  Created by Zachary Walsh on 1/25/22.
//

import Foundation
import SwiftUI

class PrimaryPopupResources: ObservableObject{
    
    @Published var FilletPopup: Bool = false
    @Published var SpicyPopup: Bool = false
    @Published var FilletSliderValue: Double = 0
    @Published var FillePopupImage: [ItemLabel] = [
        ItemLabel(Rectanglewidth: 300, Rectangleheight: 300, backgroundCircleW: 200, backgroundCircleH: 200, ImageW: 330, ImageH: 330, FSize: 50, SSpacing: 0, foodTitleFSize: 40, SColor: Color.Cgreen, productImage: "filletimg", productTitle: "Fillets", xOfset: 0, yOfset: 0)
    ]
    
}


