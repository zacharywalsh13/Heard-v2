//
//  BreadingViewModel.swift
//  Heard-v2
//
//  Created by Zachary Walsh on 1/26/22.
//

import Foundation
import SwiftUI
import Firebase

class RequestViewModel: ObservableObject {

    @Published var Request = [RequestModel]()
    
    func updateRequestData(RequestUpdate: RequestModel, updateAmount: String, time: Int) {
        
        // Get a reference to the database
        let db = Firestore.firestore()
        
        // Set the data to update
        db.collection("FoodRequest").document(RequestUpdate.id).setData(["productRequested":true,"amountRequested": updateAmount, "productSeconds": time], merge: true) { error in
            
            // Check for errors
            if error == nil {
                // Get the new data
                self.getData()
            }
        }
    }
    
    func getData() {
        let db = Firestore.firestore()
        
        db.collection("FoodRequest").getDocuments { snapshot, error in
            if error == nil {
                
                if let snapshot = snapshot {
                    
                    DispatchQueue.main.async {
                        
                        self.Request = snapshot.documents.map { d in
                            return RequestModel(id: d.documentID,
                                                productSeconds: d["productSeconds"] as? Int ?? 0,
                                                productRequested: d["productRequested"] as? Bool ?? false,
                                                amountRequested: d["amountRequested"] as? String ?? "",
                                                productImage: d["productImage"] as? String ?? "",
                                                productTitle: d["productTitle"] as? String ?? ""
                            )
                        }
                    }
                }
            }
            else {
                
            }
        }
    }
}
