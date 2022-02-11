//
//  SharedPopupModel.swift
//  Heard-v2
//
//  Created by Zachary Walsh on 1/25/22.
//

import Foundation
import SwiftUI

struct ImageModel: Identifiable{
    var id = UUID()
    var Rectanglewidth: CGFloat
    var Rectangleheight: CGFloat
    var productImage: String
    var ImageW: CGFloat
    var ImageH: CGFloat
    var xOfset: CGFloat
    var yOfset: CGFloat
    var productTitle: String
    var foodTitleFSize: CGFloat
}

struct CommonRequestModel: Identifiable {
    var id = UUID()
    var HForNUM: String
    var n1: Int
    var n2: Int
    var n3: Int
//    var function1: () -> Void
//    var function2: () -> Void
//    var function3: () -> Void
//    var functionH: () -> Void
//    var functionF: () -> Void
}


