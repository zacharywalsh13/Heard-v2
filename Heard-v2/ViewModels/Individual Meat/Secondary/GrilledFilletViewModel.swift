//
//  GrilledFilletViewModel.swift
//  Heard-v2
//
//  Created by Zachary Walsh on 2/9/22.
//

import Foundation


class GrilledFilletImageVM: ObservableObject {
    var GrilledFilletImage: [ImageModel] = [
        ImageModel(Rectanglewidth: 300, Rectangleheight: 300, productImage: "GrilledFilletsimg", ImageW: 300, ImageH: 300, xOfset: 0, yOfset: 0, productTitle: "GrilledFillet", foodTitleFSize: 40)
    ]
}



class GrilledFilletCommonRequestsVM: ObservableObject {
    
    var GrilledFilletCommonRequest: [CommonRequestModel] = [
        CommonRequestModel(HForNUM: "NUM", n1: 12, n2: 16, n3: 20)
    ]
    
}

class GrilledFilletDataVM: ObservableObject{
    var product: String = "GrilledFillets"
    var stepCount: Double = 1
    @Published var sliderValue: Double = 0
    @Published var productSeconds: Int = 0
    
    @Published var GrilledFilleto1: Bool = true
    @Published var GrilledFilleto2: Bool = false
    @Published var GrilledFilleto3: Bool = false
    
    @Published var variableID: String = ""
    @Published var GrilledFilletBatch1: Bool = false
    @Published var GrilledFilletBatch2: Bool = false
    @Published var GrilledFilletBatch3: Bool = false
    
    @Published var FinalValue: Int = 0
    
    func MultiBatch(){
        if GrilledFilletBatch1 == false {
            variableID = "GrilledFillet1"
            GrilledFilletBatch1 = true
        }
        else if GrilledFilletBatch1 == true && GrilledFilletBatch2 == false {
            variableID = "GrilledFillet2"
            GrilledFilletBatch2 = true
        }
        else if GrilledFilletBatch1 == true && GrilledFilletBatch2 == true {
            variableID = "GrilledFillet3"
            GrilledFilletBatch3 = true
        }
    }
    
    var GrilledFillet: String = "GrilledFillet"
    func o1True() {
        GrilledFilleto1 = true
        GrilledFilleto2 = false
        GrilledFilleto3 = false
        sliderValue = 0
    }
    
    func o2True(){
        GrilledFilleto1 = false
        GrilledFilleto2 = true
        GrilledFilleto3 = false
        sliderValue = 0
    }
    
    func o3True(){
        GrilledFilleto1 = false
        GrilledFilleto2 = false
        GrilledFilleto3 = true
        sliderValue = 0
    }
    func notHF() {
        print("Not hf")
    }
    
    func sendRequest(){
        if sliderValue > 0{
            GrilledFilleto1 = false
            GrilledFilleto2 = false
            GrilledFilleto3 = false
            
            FinalValue =  (Int(sliderValue))
            print(FinalValue)
        }
        if GrilledFilleto1 == true {
            FinalValue = 12
            print(FinalValue)
        }
        
        if GrilledFilleto2 == true {
            FinalValue = 16
            print(FinalValue)
        }
        
        if GrilledFilleto3 == true {
            FinalValue = 20
            print(FinalValue)
        }
    }
    
}
