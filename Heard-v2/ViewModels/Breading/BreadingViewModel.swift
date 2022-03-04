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
    
    private let db = Firestore.firestore()
    
    @Published var Request = [RequestModel]()
    
    func getData() {
        db.collection("FoodRequest").addSnapshotListener({(snapshot, error) in
            guard let documents = snapshot?.documents else {
                print ("no docs returned!")
                return
            }
            self.Request = documents.map({docSnapshot -> RequestModel in
                let data = docSnapshot.data()
                let docId = docSnapshot.documentID
                let productSeconds = data["productSeconds"] as? Int ?? 0
                let productRequested = data["productRequested"] as? Bool ?? false
                let amountRequested = data["amountRequested"] as? String ?? ""
                let productImage = data["productImage"] as? String ?? ""
                let productTitle = data["productTitle"] as? String ?? ""
                return RequestModel(id: docId, productSeconds: productSeconds, productRequested: productRequested, amountRequested: amountRequested, productImage: productImage, productTitle: productTitle)
            })
        })
    }
    func updateRequestData(RequestUpdate: RequestModel, updateAmount: String) {
        let db = Firestore.firestore()
        db.collection("FoodRequest").document(RequestUpdate.id).setData(["productRequested":true,"amountRequested": updateAmount], merge: true) { error in
            if error == nil {
                self.getData()
            }
        }
    }
    func DEupdateRequestData(RequestUpdate: RequestModel) {
        let db = Firestore.firestore()
        db.collection("FoodRequest").document(RequestUpdate.id).setData(["productRequested":false,"amountRequested": ""], merge: true) { error in
            if error == nil {
                self.getData()
            }
        }
    }
}
class RequestFormatingViewModel: ObservableObject{
    var RequestFont: CGFloat {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return 40 * 0.45
        } else {
            return 40
        }
    }
    
    var ImageCircleWH: CGFloat {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return 120 * 0.45
        } else {
            return 120
        }
    }
    
    var RequestImageWH: CGFloat {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return 170 * 0.45
        } else {
            return 170
        }
    }
    
    var ProductTitleFont: CGFloat {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return 40 * 0.45
        } else {
            return 40
        }
    }
    var ProductAmountFrameW: CGFloat {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return 160 * 0.45
        } else {
            return 160
        }
    }
    var ProductAmountFrameH: CGFloat {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return 150 * 0.45
        } else {
            return 150
        }
    }
    
    var TimerCornerRadius: CGFloat {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return 12.5 * 0.45
        } else {
            return 12.5
        }
    }
    
    var TimerFont: CGFloat {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return 60 * 0.45
        } else {
            return 60
        }
    }
    
    var TimerFrameW: CGFloat {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return 200 * 0.45
        } else {
            return 200
        }
    }
    
    var TimerFrameH: CGFloat {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return 120 * 0.45
        } else {
            return 120
        }
    }
    
    var HeardButtonFrameW: CGFloat {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return 200 * 0.45
        } else {
            return 200
        }
    }
    
    var HeardButtonFrameH: CGFloat {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return 120 * 0.45
        } else {
            return 120
        }
    }
    
    var HeardButtonCornerRadius: CGFloat {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return 15 * 0.45
        } else {
            return 15
        }
    }
    
    var RequestTemplateW: CGFloat {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return 770 * 0.455
        } else {
            return 770
        }
    }
    
    var RequestTemplateH: CGFloat {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return 150 * 0.45
        } else {
            return 150
        }
    }
    
    var RequestTemplateCornerRadius: CGFloat {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return 15 * 0.45
        } else {
            return 15
        }
    }
}
//
//class extra: ObservableObject {
//    private let db = Firestore.firestore()
//    func listenDocument() {
//        // [START listen_document]
//        db.collection("FoodRequest").document("Fillet1")
//            .addSnapshotListener { documentSnapshot, error in
//                guard let document = documentSnapshot else {
//                    print("Error fetching document: \(error!)")
//                    return
//                }
//                guard let data = document.data() else {
//                    print("Document data was empty.")
//                    return
//                }
//                print("Current data: \(data)")
//            }
//        // [END listen_document]
//
//        // [START listen_document]
//        db.collection("FoodRequest").document("Fillet2")
//            .addSnapshotListener { documentSnapshot, error in
//                guard let document = documentSnapshot else {
//                    print("Error fetching document: \(error!)")
//                    return
//                }
//                guard let data = document.data() else {
//                    print("Document data was empty.")
//                    return
//                }
//                print("Current data: \(data)")
//            }
//        // [END listen_document]
//
//        // [START listen_document]
//        db.collection("FoodRequest").document("Fillet3")
//            .addSnapshotListener { documentSnapshot, error in
//                guard let document = documentSnapshot else {
//                    print("Error fetching document: \(error!)")
//                    return
//                }
//                guard let data = document.data() else {
//                    print("Document data was empty.")
//                    return
//                }
//                print("Current data: \(data)")
//            }
//        // [END listen_document]
//
//        // [START listen_document]
//        db.collection("FoodRequest").document("GrilledFillet1")
//            .addSnapshotListener { documentSnapshot, error in
//                guard let document = documentSnapshot else {
//                    print("Error fetching document: \(error!)")
//                    return
//                }
//                guard let data = document.data() else {
//                    print("Document data was empty.")
//                    return
//                }
//                print("Current data: \(data)")
//            }
//        // [END listen_document]
//
//        // [START listen_document]
//        db.collection("FoodRequest").document("GrilledNugget2")
//            .addSnapshotListener { documentSnapshot, error in
//                guard let document = documentSnapshot else {
//                    print("Error fetching document: \(error!)")
//                    return
//                }
//                guard let data = document.data() else {
//                    print("Document data was empty.")
//                    return
//                }
//                print("Current data: \(data)")
//            }
//        // [END listen_document]
//
//        // [START listen_document]
//        db.collection("FoodRequest").document("GrilledNugget1")
//            .addSnapshotListener { documentSnapshot, error in
//                guard let document = documentSnapshot else {
//                    print("Error fetching document: \(error!)")
//                    return
//                }
//                guard let data = document.data() else {
//                    print("Document data was empty.")
//                    return
//                }
//                print("Current data: \(data)")
//            }
//        // [END listen_document]
//
//        // [START listen_document]
//        db.collection("FoodRequest").document("GrilledFillet1")
//            .addSnapshotListener { documentSnapshot, error in
//                guard let document = documentSnapshot else {
//                    print("Error fetching document: \(error!)")
//                    return
//                }
//                guard let data = document.data() else {
//                    print("Document data was empty.")
//                    return
//                }
//                print("Current data: \(data)")
//            }
//        // [END listen_document]
//
//        // [START listen_document]
//        db.collection("FoodRequest").document("Nugget1")
//            .addSnapshotListener { documentSnapshot, error in
//                guard let document = documentSnapshot else {
//                    print("Error fetching document: \(error!)")
//                    return
//                }
//                guard let data = document.data() else {
//                    print("Document data was empty.")
//                    return
//                }
//                print("Current data: \(data)")
//            }
//        // [END listen_document]
//
//        // [START listen_document]
//        db.collection("FoodRequest").document("Spicy1")
//            .addSnapshotListener { documentSnapshot, error in
//                guard let document = documentSnapshot else {
//                    print("Error fetching document: \(error!)")
//                    return
//                }
//                guard let data = document.data() else {
//                    print("Document data was empty.")
//                    return
//                }
//                print("Current data: \(data)")
//            }
//        // [END listen_document]
//
//        // [START listen_document]
//        db.collection("FoodRequest").document("Spicy2")
//            .addSnapshotListener { documentSnapshot, error in
//                guard let document = documentSnapshot else {
//                    print("Error fetching document: \(error!)")
//                    return
//                }
//                guard let data = document.data() else {
//                    print("Document data was empty.")
//                    return
//                }
//                print("Current data: \(data)")
//            }
//        // [END listen_document]
//
//        // [START listen_document]
//        db.collection("FoodRequest").document("Spicy3")
//            .addSnapshotListener { documentSnapshot, error in
//                guard let document = documentSnapshot else {
//                    print("Error fetching document: \(error!)")
//                    return
//                }
//                guard let data = document.data() else {
//                    print("Document data was empty.")
//                    return
//                }
//                print("Current data: \(data)")
//            }
//        // [END listen_document]
//
//        // [START listen_document]
//        db.collection("FoodRequest").document("Strip1")
//            .addSnapshotListener { documentSnapshot, error in
//                guard let document = documentSnapshot else {
//                    print("Error fetching document: \(error!)")
//                    return
//                }
//                guard let data = document.data() else {
//                    print("Document data was empty.")
//                    return
//                }
//                print("Current data: \(data)")
//            }
//        // [END listen_document]
//
//    }

//    func getData() {
//        let db = Firestore.firestore()
//
//        db.collection("FoodRequest").getDocuments { snapshot, error in
//            if error == nil {
//
//                if let snapshot = snapshot {
//
//                    DispatchQueue.main.async {
//
//                        self.Request = snapshot.documents.map { d in
//                            return RequestModel(id: d.documentID,
//                                                productSeconds: d["productSeconds"] as? Int ?? 0,
//                                                productRequested: d["productRequested"] as? Bool ?? false,
//                                                amountRequested: d["amountRequested"] as? String ?? "",
//                                                productImage: d["productImage"] as? String ?? "",
//                                                productTitle: d["productTitle"] as? String ?? ""
//                            )
//                        }
//                    }
//                }
//            }
//            else {
//
//            }
//        }
//    }
//
//
//}
