//
//  NuggetViewModel.swift
//  Heard-v2
//
//  Created by Zachary Walsh on 2/9/22.
//

import Foundation


class NuggetImageVM: ObservableObject {
    var NuggetImage: [ImageModel] = [
        ImageModel(Rectanglewidth: 300, Rectangleheight: 300, productImage: "nuggetsimg", ImageW: 300, ImageH: 300, xOfset: 0, yOfset: 0, productTitle: "Nugget", foodTitleFSize: 40)
    ]
}



class NuggetCommonRequestsVM: ObservableObject {
    
    var NuggetCommonRequest: [CommonRequestModel] = [
        CommonRequestModel(HForNUM: "HF", n1: 12, n2: 16, n3: 20)
    ]
    
}

class NuggetDataVM: ObservableObject{
    var product: String = "Nuggets"
    var stepCount: Double = 1
    @Published var sliderValue: Double = 0
    @Published var productSeconds: Int = 0
    
    @Published var Nuggeto1: Bool = true
    @Published var Nuggeto2: Bool = false
    @Published var Nuggeto3: Bool = false
    
    @Published var variableID: String = ""
    @Published var NuggetBatch1: Bool = false
    @Published var NuggetBatch2: Bool = false
    @Published var NuggetBatch3: Bool = false
    
    @Published var FinalValue: Int = 0
    
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
        sliderValue = 0
    }
    
    func o2True(){
        Nuggeto1 = false
        Nuggeto2 = true
        Nuggeto3 = false
        sliderValue = 0
    }
    
    func o3True(){
        Nuggeto1 = false
        Nuggeto2 = false
        Nuggeto3 = true
        sliderValue = 0
    }
    func notHF() {
        print("Not hf")
    }
    
    func sendRequest(){
        if sliderValue > 0{
            Nuggeto1 = false
            Nuggeto2 = false
            Nuggeto3 = false
            
            FinalValue =  (Int(sliderValue))
            print(FinalValue)
        }
        if Nuggeto1 == true {
            FinalValue = 12
            print(FinalValue)
        }
        
        if Nuggeto2 == true {
            FinalValue = 16
            print(FinalValue)
        }
        
        if Nuggeto3 == true {
            FinalValue = 20
            print(FinalValue)
        }
    }
    
}
