//
//  LocationModel.swift
//  Heard-v2
//
//  Created by Zachary Walsh on 1/15/22.
//

import Foundation


//struct BreadLineModel: Identifiable {
//    let id = UUID()
//    var title: String
//}

struct BreadLineModel: Identifiable {
    let id: String
    var title: String
}

struct PrimarySecondaryModel: Identifiable {
    var id = UUID()
    var title: String
}
