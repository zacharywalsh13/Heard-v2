//
//  BreadingModel.swift
//  Heard-v2
//
//  Created by Zachary Walsh on 1/26/22.
//

import Foundation
import SwiftUI

struct RequestModel: Identifiable {
    var id: String
    var variableButtonStage: String = ""
    var isGrilled: Bool = false
    var productSeconds: Int
    var productRequested: Bool
    var amountRequested: String
    var productImage: String 
    var productTitle: String
}
