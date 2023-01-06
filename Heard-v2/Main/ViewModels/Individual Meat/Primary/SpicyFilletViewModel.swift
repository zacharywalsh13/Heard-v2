//
//  SpicyFilletViewModel.swift
//  Heard-v2
//
//  Created by Zachary Walsh on 1/25/22.
//

import Foundation
import SwiftUI

class SpicyFilletImageVM: ObservableObject {
    var SpicyFilletImage: [ImageModel] = [
        ImageModel(Rectanglewidth: 300, Rectangleheight: 300, productImage: "Spicy", ImageW: 300, ImageH: 300, xOfset: 0, yOfset: 0, productTitle: "Spicy Fillets", foodTitleFSize: 40)
    ]
}



class SpicyFilletCommonRequestsVM: ObservableObject {
    
    var SpicyFilletCommonRequest: [CommonRequestModel] = [
        CommonRequestModel(HForNUM: "NUM", n1: 10, n2: 14, n3: 18)
    ]
    
}

class SpicyFilletDataVM: ObservableObject{
    var product: String = "Spciy Fillets"
    var stepCount: Double = 1
    @Published var sliderValue: Double = 0
    
    @Published var SpicyFilleto1: Bool = true
    @Published var SpicyFilleto2: Bool = false
    @Published var SpicyFilleto3: Bool = false
    @Published var SpicyFilleto4: Bool = false
    
    @Published var variableID: String = ""
    @Published var SFilletBatch1: Bool = false
    @Published var SFilletBatch2: Bool = false
    @Published var SFilletBatch3: Bool = false
    
    @Published var FinalValue: String = "0"
    
    func MultiBatch(){
        if SFilletBatch1 == false {
            variableID = "Spicy1"
            SFilletBatch1 = true
        }
        else if SFilletBatch1 == true && SFilletBatch2 == false {
            variableID = "Spicy2"
            SFilletBatch2 = true
        }
        else if SFilletBatch1 == true && SFilletBatch2 == true {
            variableID = "Spicy3"
            SFilletBatch3 = true
        }
    }
    
    var spicy: String = "Spicy"
    func o1True() {
        SpicyFilleto1 = true
        SpicyFilleto2 = false
        SpicyFilleto3 = false
        SpicyFilleto4 = false
        sliderValue = 0
        print(SpicyFilleto1, SpicyFilleto2, SpicyFilleto3, spicy)
    }
    
    func o2True(){
        SpicyFilleto1 = false
        SpicyFilleto2 = true
        SpicyFilleto3 = false
        SpicyFilleto4 = false
        sliderValue = 0
        print(SpicyFilleto1, SpicyFilleto2, SpicyFilleto3, spicy)
    }
    
    func o3True(){
        SpicyFilleto1 = false
        SpicyFilleto2 = false
        SpicyFilleto3 = true
        SpicyFilleto4 = false
        sliderValue = 0
        print(SpicyFilleto1, SpicyFilleto2, SpicyFilleto3, spicy)
        
    }
    
    func o4True(){
        SpicyFilleto1 = false
        SpicyFilleto2 = false
        SpicyFilleto3 = false
        SpicyFilleto4 = true
        sliderValue = 0
        print(SpicyFilleto1, SpicyFilleto2, SpicyFilleto3, spicy)
        
    }
    func notHF() {
        print("Not hf")
    }
    
    func sendRequest(){
        if sliderValue > 0{
            SpicyFilleto1 = false
            SpicyFilleto2 = false
            SpicyFilleto3 = false
            SpicyFilleto4 = false
            
            FinalValue =  (String(sliderValue))
            print(FinalValue)
        }
        if SpicyFilleto1 == true {
            FinalValue = "10"
            print(FinalValue)
        }
        
        if SpicyFilleto2 == true {
            FinalValue = "14"
            print(FinalValue)
        }
        
        if SpicyFilleto3 == true {
            FinalValue = "18"
            print(FinalValue)
        }
        
        if SpicyFilleto4 == true {
            FinalValue = "Lean Batch"
            print(FinalValue)
        }
    }
    
}
