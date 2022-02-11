//
//  LineModel.swift
//  Heard-v2
//
//  Created by Zachary Walsh on 1/17/22.
//

import Foundation
import SwiftUI

struct ItemLabel: Identifiable{
    let id = UUID()
    let Rectanglewidth: CGFloat
    let Rectangleheight: CGFloat
    let backgroundCircleW: CGFloat
    let backgroundCircleH: CGFloat
    let ImageW: CGFloat
    let ImageH: CGFloat
    let FSize: CGFloat
    let SSpacing: CGFloat
    let foodTitleFSize: CGFloat
    let SColor: Color
    let productImage: String
    let productTitle: String
    let xOfset: CGFloat
    let yOfset: CGFloat
}

