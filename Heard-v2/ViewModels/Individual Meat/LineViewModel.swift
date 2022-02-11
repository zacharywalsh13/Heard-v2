//
//  LineViewModel.swift
//  Heard-v2
//
//  Created by Zachary Walsh on 1/17/22.
//

import Foundation
import SwiftUI

class LineViewModel: ObservableObject {
    
    @Published var FilletPopup: Bool = false
    @Published var SpicyFilletPopup: Bool = false
    @Published var NuggetPopup: Bool = false
    @Published var StripPopup: Bool = false
    @Published var GrilledNuggetPopup: Bool = false
    @Published var GrilledFilletPopup: Bool = false

    @Published var products1: [ItemLabel] = [
        ItemLabel(Rectanglewidth: 350, Rectangleheight: 350, backgroundCircleW: 200, backgroundCircleH: 200, ImageW: 450, ImageH: 450, FSize: 50, SSpacing: 0, foodTitleFSize: 45, SColor: Color.Cgreen, productImage: "nuggetsimg", productTitle: "Nuggets", xOfset: -3, yOfset: 15),
        ItemLabel(Rectanglewidth: 350, Rectangleheight: 350, backgroundCircleW: 200, backgroundCircleH: 200, ImageW: 400, ImageH: 400, FSize: 50, SSpacing: 0, foodTitleFSize: 45, SColor: Color.Cgreen, productImage: "stripimg", productTitle: "Strips",xOfset: 17, yOfset: 0)
       ]
    
    @Published var products2: [ItemLabel] = [
        ItemLabel(Rectanglewidth: 350, Rectangleheight: 350, backgroundCircleW: 200, backgroundCircleH: 200, ImageW: 370, ImageH: 370, FSize: 50, SSpacing: 0, foodTitleFSize: 45, SColor: Color.Cgreen, productImage: "gnuggetimg", productTitle: "Grilled Nuggets",xOfset: 5, yOfset: -30),
        ItemLabel(Rectanglewidth: 350, Rectangleheight: 350, backgroundCircleW: 200, backgroundCircleH: 200, ImageW: 400, ImageH: 400, FSize: 50, SSpacing: 0, foodTitleFSize: 45, SColor: Color.Cgreen, productImage: "gfilletimg", productTitle: "Grilled Filets",xOfset: 0, yOfset: 0)
    ]
    
    @Published var products3: [ItemLabel] = [
        ItemLabel(Rectanglewidth: 420, Rectangleheight: 420, backgroundCircleW: 300, backgroundCircleH: 300, ImageW: 420, ImageH: 420, FSize: 50, SSpacing: 0, foodTitleFSize: 40, SColor: Color.Cgreen, productImage: "filletimg", productTitle: "Filets", xOfset: 0, yOfset: 0),
        ItemLabel(Rectanglewidth: 420, Rectangleheight: 420, backgroundCircleW: 300, backgroundCircleH: 300, ImageW: 400, ImageH: 400, FSize: 50, SSpacing: 0, foodTitleFSize: 40, SColor: Color.Cgreen, productImage: "sfilletimg", productTitle: "Spicy Filets", xOfset: 0, yOfset: 0)
    ]
    }
    

