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
                let productRequested = data["productRequested"] as? Bool ?? false
                let amountRequested = data["amountRequested"] as? String ?? ""
                let productImage = data["productImage"] as? String ?? ""
                let productTitle = data["productTitle"] as? String ?? ""
                let SecondRequested = data["SecondRequested"] as? Int ?? 0
                return RequestModel(id: docId, productRequested: productRequested, amountRequested: amountRequested, productImage: productImage, productTitle: productTitle, SecondRequested: SecondRequested)
            })
        })
    }
    func updateRequestData(RequestUpdate: RequestModel, updateAmount: String, CurrentTime: Int) {
        let db = Firestore.firestore()
        db.collection("FoodRequest").document(RequestUpdate.id).setData(["productRequested":true, "amountRequested": updateAmount, "SecondRequested": CurrentTime], merge: true) { error in
            if error == nil {
                self.getData()
            }
        }
    }
    func DEupdateRequestData(RequestUpdate: RequestModel) {
        let db = Firestore.firestore()
        db.collection("FoodRequest").document(RequestUpdate.id).setData(["productRequested":false,"amountRequested": "","SecondRequested":0], merge: true) { error in
            if error == nil {
                self.getData()
            }
        }
    }
}

class RequestTimers: ObservableObject{
    
    @Published var currentTime: Int = 0 
    
    @Published var Nugget1: Int = 0
    @Published var Nugget2: Int = 0
    @Published var Nugget3: Int = 0
    @Published var Strip1: Int = 0
    @Published var Strip2: Int = 0
    @Published var Strip3: Int = 0
    @Published var Fillet1: Int = 0
    @Published var Fillet2: Int = 0
    @Published var Fillet3: Int = 0
    @Published var Spicy1: Int = 0
    @Published var Spicy2: Int = 0
    @Published var Spicy3: Int = 0
    @Published var GFillet1: Int = 0
    @Published var GFillet2: Int = 0
    @Published var GFillet3: Int = 0
    @Published var GNugget1: Int = 0
    @Published var GNugget2: Int = 0
    @Published var GNugget3: Int = 0

}

class RequestFormatingViewModel: ObservableObject{
    var RequestFont: CGFloat {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return 50 * 0.45
        } else {
            return 50
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
            return 140 * 0.45
        } else {
            return 140
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
            return 750 * 0.455
        } else {
            return 750
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
