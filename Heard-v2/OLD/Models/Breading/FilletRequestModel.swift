//
//  FilletRequestModel.swift
//  Heard-v2
//
//  Created by Zachary Walsh on 1/31/22.
//

import Foundation
import SwiftUI


struct FilletRequestModel: Identifiable {
    var id: String
    var productRequested: Bool
    var amountRequested: String
    var productImage: String = "Fillets"
    var productTitle: String = "fillets"
}

