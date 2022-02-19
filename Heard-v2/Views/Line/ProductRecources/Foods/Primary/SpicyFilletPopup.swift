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

    var body: some View {
        VStack(spacing: 20){
            SpicyfilletImgage()
            Text("How many?")
                .font(.title)
            SpicyfilletCommonRequests()
            SpicyfilletSlider()
            Button(action: {
                SpicyFilletData.MultiBatch()
                SpicyFilletData.sendRequest()
                LineItems.SpicyFilletPopup.toggle()
                Requests.updateRequestData(RequestUpdate: RequestModel(id: SpicyFilletData.variableID, productSeconds: 0, productRequested: true, amountRequested: String(SpicyFilletData.FinalValue), productImage: "sfilletimg", productTitle: "Sfillets"), updateAmount: String(SpicyFilletData.FinalValue))
            }, label: {
                Text("Send")
                    .bold()
                    .frame(width: 250, height: 75, alignment: .center)
                    .foregroundColor(.white)
                    .font(.title2)
                    .background(Color.CFAred)
                    .cornerRadius(25)
            })
        }
        .frame(width: 500, height: 850, alignment: .center)
        .background(Color.reallyLightGrey.opacity(0.88))
        .cornerRadius(40)
        
    }
}

struct SpicyfilletImgage: View{
    @ObservedObject var SpicyFilletImVM = SpicyFilletImageVM()
    var body: some View{
        ForEach(SpicyFilletImVM.SpicyFilletImage) { ImageModel in
            imageReusable(Rectanglewidth: ImageModel.Rectanglewidth, Rectangleheight: ImageModel.Rectangleheight, productImage: ImageModel.productImage, ImageW: ImageModel.ImageW, ImageH: ImageModel.ImageH, xOfset: ImageModel.xOfset, yOfset: ImageModel.yOfset, productTitle: ImageModel.productTitle, foodTitleFSize: ImageModel.foodTitleFSize)
        }
    }
}

struct SpicyfilletCommonRequests: View{
    @ObservedObject var SpicyFilletCrVM = SpicyFilletCommonRequestsVM()
    @EnvironmentObject var SpicyFilletData: SpicyFilletDataVM

    var body: some View{
        ForEach(SpicyFilletCrVM.SpicyFilletCommonRequest) { CommonRequestModel in
            CommonRequestReusable(HForNUM: CommonRequestModel.HForNUM, n1: CommonRequestModel.n1, n2: CommonRequestModel.n2, n3: CommonRequestModel.n3, o1: SpicyFilletData.SpicyFilleto1, o2: SpicyFilletData.SpicyFilleto2, o3: SpicyFilletData.SpicyFilleto3, oH: false, oF: false, sliderValue: SpicyFilletData.sliderValue, function1: SpicyFilletData.o1True, function2: SpicyFilletData.o2True, function3: SpicyFilletData.o3True, functionH: SpicyFilletData.notHF, functionF: SpicyFilletData.notHF)
        }
    }
}


struct SpicyfilletSlider: View{
    @EnvironmentObject var SpicyFilletData: SpicyFilletDataVM
    var body: some View{
        sliderReusable(SliderProduct: SpicyFilletData.product, stepCount: SpicyFilletData.stepCount, range: 24, sliderAmount: $SpicyFilletData.sliderValue)
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
