//
//  StripViewModel.swift
//  Heard-v2
//
//  Created by Zachary Walsh on 2/11/22.
//

import Foundation


class StripImageVM: ObservableObject {
    var StripImage: [ImageModel] = [
        ImageModel(Rectanglewidth: 300, Rectangleheight: 300, productImage: "Strips", ImageW: 300, ImageH: 300, xOfset: 0, yOfset: 0, productTitle: "Strip", foodTitleFSize: 40)
    ]
}



class StripCommonRequestsVM: ObservableObject {
    
    var StripCommonRequest: [CommonRequestModel] = [
        CommonRequestModel(HForNUM: "NUM", n1: 8, n2: 16, n3: 24)
    ]
    
}

class StripDataVM: ObservableObject{
    var product: String = "Strips"
    var stepCount: Double = 1
    @Published var sliderValue: Double = 0
    
    @Published var Stripo1: Bool = true
    @Published var Stripo2: Bool = false
    @Published var Stripo3: Bool = false
    @Published var Stripo4: Bool = false
    
    @Published var variableID: String = ""
    @Published var StripBatch1: Bool = false
    @Published var StripBatch2: Bool = false
    @Published var StripBatch3: Bool = false
    
    @Published var FinalValue: String = ""
    
    func MultiBatch(){
        if StripBatch1 == false {
            variableID = "Strip1"
            StripBatch1 = true
        }
        else if StripBatch1 == true && StripBatch2 == false {
            variableID = "Strip2"
            StripBatch2 = true
        }
        else if StripBatch1 == true && StripBatch2 == true {
            variableID = "Strip3"
            StripBatch3 = true
        }
    }
    
    var Strip: String = "Strip"
    func o1True() {
        Stripo1 = true
        Stripo2 = false
        Stripo3 = false
        Stripo4 = false
        sliderValue = 0
    }
    
    func o2True(){
        Stripo1 = false
        Stripo2 = true
        Stripo3 = false
        Stripo4 = false
        sliderValue = 0
    }
    
    func o3True(){
        Stripo1 = false
        Stripo2 = false
        Stripo3 = true
        Stripo4 = false
        sliderValue = 0
    }
    
    func o4True(){
        Stripo1 = false
        Stripo2 = false
        Stripo3 = false
        Stripo4 = true
        sliderValue = 0
    }
    
    func notHF() {
        print("Not hf")
    }
    
    func sendRequest(){
        if sliderValue > 0{
            Stripo1 = false
            Stripo2 = false
            Stripo3 = false
            Stripo4 = false

            FinalValue =  (String(sliderValue))
            print(FinalValue)
        }
        if Stripo1 == true {
            FinalValue = "8"
            print(FinalValue)
        }
        
        if Stripo2 == true {
            FinalValue = "16"
            print(FinalValue)
        }
        
        if Stripo3 == true {
            FinalValue = "24"
            print(FinalValue)
        }
        if Stripo4 == true {
            FinalValue = "Lean Batch"
            print("Lean Batch")
        }
    }
    
}
