//
//  GrilledNuggetViewModel.swift
//  Heard-v2
//
//  Created by Zachary Walsh on 2/9/22.
//

import Foundation


class GrilledNuggetImageVM: ObservableObject {
    var GrilledNuggetImage: [ImageModel] = [
        ImageModel(Rectanglewidth: 300, Rectangleheight: 300, productImage: "gnuggetimg", ImageW: 300, ImageH: 300, xOfset: 0, yOfset: 0, productTitle: "GrilledNugget", foodTitleFSize: 40)
    ]
}



class GrilledNuggetCommonRequestsVM: ObservableObject {
    
    var GrilledNuggetCommonRequest: [CommonRequestModel] = [
        CommonRequestModel(HForNUM: "HF", n1: 12, n2: 16, n3: 20)
    ]
    
}

class GrilledNuggetDataVM: ObservableObject{
    var product: String = "Cup/s"
    var stepCount: Double = 1
    @Published var sliderValue: Double = 0
    @Published var productSeconds: Int = 0
    
    @Published var GrilledNuggeto1: Bool = false
    @Published var GrilledNuggeto2: Bool = false
    @Published var GrilledNuggeto3: Bool = false
    
    @Published var GrilledNuggetoH: Bool = true
    @Published var GrilledNuggetoF: Bool = false
    
    @Published var variableID: String = ""
    @Published var GrilledNuggetBatch1: Bool = false
    @Published var GrilledNuggetBatch2: Bool = false
    @Published var GrilledNuggetBatch3: Bool = false
    
    @Published var FinalValue: String = ""
    
    func MultiBatch(){
        if GrilledNuggetBatch1 == false {
            variableID = "GrilledNugget1"
            GrilledNuggetBatch1 = true
        }
        else if GrilledNuggetBatch1 == true && GrilledNuggetBatch2 == false {
            variableID = "GrilledNugget2"
            GrilledNuggetBatch2 = true
        }
        else if GrilledNuggetBatch1 == true && GrilledNuggetBatch2 == true {
            variableID = "GrilledNugget3"
            GrilledNuggetBatch3 = true
        }
    }
    
    var GrilledNugget: String = "GrilledNugget"
    func o1True() {
        GrilledNuggeto1 = true
        GrilledNuggeto2 = false
        GrilledNuggeto3 = false
        sliderValue = 0
    }
    
    func o2True(){
        GrilledNuggeto1 = false
        GrilledNuggeto2 = true
        GrilledNuggeto3 = false
        sliderValue = 0
    }
    
    func o3True(){
        GrilledNuggeto1 = false
        GrilledNuggeto2 = false
        GrilledNuggeto3 = true
        sliderValue = 0
    }
    func Half() {
        GrilledNuggetoH = true
        GrilledNuggetoF = false
        sliderValue = 0
    }
    
    func Full() {
        GrilledNuggetoH = false
        GrilledNuggetoF = true
        sliderValue = 0
    }
    
    func sendRequest(){
        if sliderValue > 0{
            GrilledNuggeto1 = false
            GrilledNuggeto2 = false
            GrilledNuggeto3 = false
            GrilledNuggetoF = false
            GrilledNuggetoH = false
            FinalValue =  (String(sliderValue))
            print(FinalValue)
        }
        if GrilledNuggeto1 == true {
            FinalValue = String(12)
            print(FinalValue)
        }
        
        if GrilledNuggeto2 == true {
            FinalValue = String(16)
            print(FinalValue)
        }
        
        if GrilledNuggeto3 == true {
            FinalValue = String(20)
            print(FinalValue)
        }
        if GrilledNuggetoF == true {
            FinalValue = "Full-Batch"
        }
        if GrilledNuggetoH == true {
            FinalValue = "Half-Batch"
        }
    }
    
}
