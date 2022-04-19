//
//  FilletViewModel.swift
//  Heard-v2
//
//  Created by Zachary Walsh on 1/25/22.
//

import Foundation
import SwiftUI
import Firebase

class FilletImageVM: ObservableObject {
    var FilletImage: [ImageModel] = [
        ImageModel(Rectanglewidth: 300, Rectangleheight: 300, productImage: "Fillets", ImageW: 330, ImageH: 330, xOfset: 0, yOfset: 0, productTitle: "Fillets", foodTitleFSize: 40)
    ]
}



class FilletCommonRequestsVM: ObservableObject {
    
    var FilletCommonRequest: [CommonRequestModel] = [
        CommonRequestModel(HForNUM: "NUM", n1: 12, n2: 16, n3: 24)
    ]
    
}

class FilletDataVM: ObservableObject{
    var product: String = "Fillets"
    var stepCount: Double = 1
    @Published var variableID: String = ""
    
    @Published var sliderValue: Double = 0
    
    @Published var Filleto1: Bool = true
    @Published var Filleto2: Bool = false
    @Published var Filleto3: Bool = false
    @Published var Filleto4: Bool = false

    
    @Published var FilletBatch1: Bool = false
    @Published var FilletBatch2: Bool = false
    @Published var FilletBatch3: Bool = false

    @Published var FinalValue: String = ""
    
    @Published var FilletRequest = [FilletRequestModel]()
    
    func MultiBatch(){
        if FilletBatch1 == false {
            variableID = "Fillet1"
            FilletBatch1 = true
        }
        else if FilletBatch1 == true && FilletBatch2 == false {
            variableID = "Fillet2"
            FilletBatch2 = true
        }
        else if FilletBatch1 == true && FilletBatch2 == true {
            variableID = "Fillet3"
            FilletBatch3 = true
        }
    }
    
    var fillet: String = "fillet"

        func o1True() {
        Filleto1 = true
        Filleto2 = false
        Filleto3 = false
        Filleto4 = false
        sliderValue = 0
        print(Filleto1, Filleto2, Filleto3,fillet)
    }
    
    func o2True(){
        Filleto1 = false
        Filleto2 = true
        Filleto3 = false
        Filleto4 = false
        sliderValue = 0
        print(Filleto1, Filleto2, Filleto3,fillet)
    }
    
    func o3True(){
        Filleto1 = false
        Filleto2 = false
        Filleto3 = true
        Filleto4 = false
        sliderValue = 0
        print(Filleto1, Filleto2, Filleto3,fillet)
        
    }
    func o4True(){
        Filleto1 = false
        Filleto2 = false
        Filleto3 = false
        Filleto4 = true
        sliderValue = 0
        print(Filleto1, Filleto2, Filleto3,fillet)
        
    }
    
    func notHF() {
        print("Not hf")
    }
    
    func sendRequest(){
        if sliderValue > 0{
            Filleto1 = false
            Filleto2 = false
            Filleto3 = false
            Filleto4 = false
            
            FinalValue =  (String(sliderValue))
            print(FinalValue)
        }
        if Filleto1 == true {
            FinalValue = "12"
            print(FinalValue)
        }
        
        if Filleto2 == true {
            FinalValue = "16"
            print(FinalValue)
        }
        
        if Filleto3 == true {
            FinalValue = "24"
            print(FinalValue)
        }
        if Filleto4 == true {
            FinalValue = "Lean Batch"
        }
    }
    
}
