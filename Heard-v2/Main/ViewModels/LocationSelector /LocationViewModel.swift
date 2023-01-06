//
//  LocationViewModel.swift
//  Heard-v2
//
//  Created by Zachary Walsh on 1/17/22.
//

import Foundation
import Firebase
import SwiftUI

class LocationViewModel: ObservableObject {
    
//    @Published var L_B_Buttons: [BreadLineModel] = [
//        BreadLineModel(title: "Breading"),
//        BreadLineModel(title: "Line")
//    ]
//    @Published var L_B_Buttons = [BreadLineModel]()
    
    @Published var L_B_Buttons: [BreadLineModel] = [
        BreadLineModel(id: "id", title: "Breading"),
        BreadLineModel(id: "id2", title: "Line")
    ]
    
//    func updateData(BLupdate: BreadLineModel) {
//
//        // Get a reference to the database
//        let db = Firestore.firestore()
//
//        // Set the data to update
//        db.collection("Locations").document(BLupdate.id).setData(["title":"Updated"], merge: true) { error in
//
//            // Check for errors
//            if error == nil {
//                // Get the new data
//                self.getData()
//            }
//        }
//    }
//
//    func getData() {
//        let db = Firestore.firestore()
//
//        db.collection("Locations").getDocuments { snapshot, error in
//            if error == nil {
//
//                if let snapshot = snapshot {
//
//                    DispatchQueue.main.async {
//
//                        self.L_B_Buttons = snapshot.documents.map { d in
//                            return BreadLineModel(id: d.documentID,
//                                                  title: d["title"] as? String ?? "")
//
//                        }
//                    }
//                }
//            }
//            else {
//
//            }
//        }
//    }
    
    @Published var P_S_Buttons: [PrimarySecondaryModel] = [
        PrimarySecondaryModel(title: "Primary"),
        PrimarySecondaryModel(title: "Secondary")
    ]
    
    @Published var NavigationState: String? = nil
    
}
