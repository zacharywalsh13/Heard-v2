//
//  NuggetViewModel.swift
//  Heard-v2
//
//  Created by Zachary Walsh on 2/9/22.
//

import Foundation
import SwiftUI

class NuggetImageVM: ObservableObject {
    
    var RectangleWH: CGFloat { if UIDevice.current.userInterfaceIdiom == .phone {
        return 300 * 0.75
    } else {
        return 300
    }
}
    var ImageWH: CGFloat { if UIDevice.current.userInterfaceIdiom == .phone {
        return 400 * 0.75
    } else {
        return 400
    }
}
    var foodTitleFSize: CGFloat { if UIDevice.current.userInterfaceIdiom == .phone {
        return 40 * 0.75
    } else {
        return 40
    }
}
    var NuggetImage: [ImageModel] = [
        ImageModel(Rectanglewidth: 400, Rectangleheight: 400, productImage: "Nuggets", ImageW: 400, ImageH: 400, xOfset: 0, yOfset: 0, productTitle: "Nugget", foodTitleFSize: 40)
    ]
}



class NuggetCommonRequestsVM: ObservableObject {
    
    var NuggetCommonRequest: [CommonRequestModel] = [
        CommonRequestModel(HForNUM: "HF", n1: 12, n2: 16, n3: 20)
    ]
    
}

class NuggetDataVM: ObservableObject{
    var product: String = "Cup/s"
    var stepCount: Double = 1
    @Published var sliderValue: Double = 0
    
    @Published var Nuggeto1: Bool = true
    @Published var Nuggeto2: Bool = false
    @Published var Nuggeto3: Bool = false
    @Published var Nuggeto4: Bool = false
    
    @Published var NuggetoH: Bool = true
    @Published var NuggetoF: Bool = false
    
    @Published var variableID: String = ""
    @Published var NuggetBatch1: Bool = false
    @Published var NuggetBatch2: Bool = false
    @Published var NuggetBatch3: Bool = false
    
    @Published var FinalValue: String = ""
    
    func MultiBatch(){
        if NuggetBatch1 == false {
            variableID = "Nugget1"
            NuggetBatch1 = true
        }
        else if NuggetBatch1 == true && NuggetBatch2 == false {
            variableID = "Nugget2"
            NuggetBatch2 = true
        }
        else if NuggetBatch1 == true && NuggetBatch2 == true {
            variableID = "Nugget3"
            NuggetBatch3 = true
        }
    }
    
    var nugget: String = "Nugget"
    func o1True() {
        Nuggeto1 = true
        Nuggeto2 = false
        Nuggeto3 = false
        Nuggeto4 = false
        sliderValue = 0
    }
    
    func o2True(){
        Nuggeto1 = false
        Nuggeto2 = true
        Nuggeto3 = false
        Nuggeto4 = false
        sliderValue = 0
    }
    
    func o3True(){
        Nuggeto1 = false
        Nuggeto2 = false
        Nuggeto3 = true
        Nuggeto4 = false
        sliderValue = 0
    }
    
    func LeanBatch() {
        NuggetoH = false
        NuggetoF = false
        Nuggeto4 = true
    }
    
    func Half() {
        NuggetoH = true
        NuggetoF = false
        Nuggeto4 = false
        sliderValue = 0
    }
    
    func Full() {
        NuggetoH = false
        NuggetoF = true
        Nuggeto4 = false
        sliderValue = 0
    }
    
    func sendRequest(){
        if sliderValue > 0{
            Nuggeto1 = false
            Nuggeto2 = false
            Nuggeto3 = false
            Nuggeto4 = false
            NuggetoF = false
            NuggetoH = false
            FinalValue =  (String(sliderValue))
            print(FinalValue)
        }
        if Nuggeto1 == true {
            FinalValue = String(12)
            print(FinalValue)
        }
        
        if Nuggeto2 == true {
            FinalValue = String(16)
            print(FinalValue)
        }
        
        if Nuggeto3 == true {
            FinalValue = String(20)
            print(FinalValue)
        }
        if Nuggeto4 == true {
            FinalValue = "Lean Batch"
        }
        
        if NuggetoF == true {
            FinalValue = "Full-Batch"
        }
        if NuggetoH == true {
            FinalValue = "Half Batch"
        }
    }
    
}
