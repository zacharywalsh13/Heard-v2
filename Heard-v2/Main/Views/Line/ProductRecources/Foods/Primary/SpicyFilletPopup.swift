//
//  FilletPopup.swift
//  Heard-v2
//
//  Created by Zachary Walsh on 1/25/22.
//

import SwiftUI

struct SpicyFilletPopup: View{
    @EnvironmentObject var SpicyFilletData: SpicyFilletDataVM
    @EnvironmentObject var LineItems: LineViewModel
    @ObservedObject var Requests = RequestViewModel()

    
    func close() {
        LineItems.SpicyFilletPopup = false 
    }
    
    func totalSeconds() -> Int {
        let components = Calendar.current.dateComponents([.hour, .second, .minute], from: Date())

        let currentHour = components.hour ?? 0
        let currentMinute = components.minute ?? 0
        let currentSecond = components.second ?? 0
        
        let totalSeconds = (currentSecond) + (currentMinute * 60) + (currentHour * 3600)
        
        return Int(totalSeconds)
    }
    
    
    var body: some View {
        VStack(spacing: 20){
            HStack {
                ClosePopup(closeFunction: close)
                    .padding(.leading, 50)
                Spacer()
            }
            SpicyfilletImgage()
            Text("Quick Select")
                .font(.title)
            SpicyfilletCommonRequests()
            
//            Button(action: {
//
//            }, label: {
//                Text("Lean Batch")
//                    .modifier(LeanBathcMod(LeanBatchBool: SpicyFilletData.SpicyFilleto4))
//            })
            
//            SpicyfilletSlider()
            Button(action: {
                LineItems.ShowRequestOptions = false
                SpicyFilletData.MultiBatch()
                SpicyFilletData.sendRequest()
                LineItems.SpicyFilletPopup.toggle()
                Requests.updateRequestData(RequestUpdate: RequestModel(id: SpicyFilletData.variableID, productRequested: true, amountRequested: String(SpicyFilletData.FinalValue), productImage: "Spicy", productTitle: "Sfillets", SecondRequested: totalSeconds()), updateAmount: String(SpicyFilletData.FinalValue), CurrentTime: totalSeconds())
            }, label: {
                Text("Send")
                    .bold()
                    .frame(width: 250, height: 75, alignment: .center)
                    .foregroundColor(.white)
                    .font(.title2)
                    .background(Color.FiletBlue)
                    .cornerRadius(25)
            })
        }
        .frame(width: 550, height: 900, alignment: .center)
        .background(Color.white)
        .cornerRadius(40)
        .shadow(radius: 3)

    }
}

struct SpicyfilletImgage: View{
    @ObservedObject var SpicyFilletImVM = SpicyFilletImageVM()
    var body: some View{
        ForEach(SpicyFilletImVM.SpicyFilletImage) { ImageModel in
            imageReusable(Rectanglewidth: 400, Rectangleheight: 400, productImage: ImageModel.productImage, ImageW: 350, ImageH: 350, xOfset: ImageModel.xOfset, yOfset: ImageModel.yOfset, productTitle: "Spicy Filets", foodTitleFSize: ImageModel.foodTitleFSize)
        }
    }
}

struct SpicyfilletCommonRequests: View{
    @ObservedObject var SpicyFilletCrVM = SpicyFilletCommonRequestsVM()
    @EnvironmentObject var SpicyFilletData: SpicyFilletDataVM

    var body: some View{
        ForEach(SpicyFilletCrVM.SpicyFilletCommonRequest) { CommonRequestModel in
            CommonRequestReusable(HForNUM: CommonRequestModel.HForNUM, n1: CommonRequestModel.n1, n2: CommonRequestModel.n2, n3: CommonRequestModel.n3, o1: SpicyFilletData.SpicyFilleto1, o2: SpicyFilletData.SpicyFilleto2, o3: SpicyFilletData.SpicyFilleto3, o4: SpicyFilletData.SpicyFilleto4, oH: false, oF: false, sliderValue: SpicyFilletData.sliderValue, function1: SpicyFilletData.o1True, function2: SpicyFilletData.o2True, function3: SpicyFilletData.o3True, function4: SpicyFilletData.o4True, functionH: SpicyFilletData.notHF, functionF: SpicyFilletData.notHF)
        }
    }
}


struct SpicyfilletSlider: View{
    @EnvironmentObject var SpicyFilletData: SpicyFilletDataVM
    var body: some View{
        sliderReusable(SliderProduct: "Spicy Filets", stepCount: SpicyFilletData.stepCount, range: 24, sliderAmount: $SpicyFilletData.sliderValue)
    }
}

struct SpicyFilletPopup_Previews: PreviewProvider {
    static var previews: some View {
        SpicyFilletPopup()
            .environmentObject(FilletDataVM())
            .environmentObject(SpicyFilletDataVM())
            .environmentObject(LineViewModel())
    }
}
