//
//  GrilledFilletPopup.swift
//  Heard-v2
//
//  Created by Zachary Walsh on 2/11/22.
//

//
//  FilletPopup.swift
//  Heard-v2
//
//  Created by Zachary Walsh on 1/25/22.
//

import SwiftUI

struct GrilledFilletPopup: View{
    @EnvironmentObject var GrilledFilletData: GrilledFilletDataVM
    @EnvironmentObject var LineItems: LineViewModel
    @ObservedObject var Requests = RequestViewModel()
    
    var body: some View {
        VStack(spacing: 20){
            GrilledFilletImgage()
            Text("How many?")
                .font(.title)
            GrilledFilletCommonRequests()
            GrilledFilletSlider()
            Button(action: {
                GrilledFilletData.MultiBatch()
                GrilledFilletData.sendRequest()
                LineItems.GrilledFilletPopup.toggle()
                Requests.updateRequestData(RequestUpdate: RequestModel(id: GrilledFilletData.variableID, productSeconds: 0, productRequested: true, amountRequested: String(GrilledFilletData.FinalValue), productImage: "GrilledFilletsimg", productTitle: "GrilledFillets"), updateAmount: String(GrilledFilletData.FinalValue), time: 0)
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

struct GrilledFilletImgage: View{
    @ObservedObject var GrilledFilletImVM = GrilledFilletImageVM()
    var body: some View{
        ForEach(GrilledFilletImVM.GrilledFilletImage) { ImageModel in
            imageReusable(Rectanglewidth: ImageModel.Rectanglewidth, Rectangleheight: ImageModel.Rectangleheight, productImage: ImageModel.productImage, ImageW: ImageModel.ImageW, ImageH: ImageModel.ImageH, xOfset: ImageModel.xOfset, yOfset: ImageModel.yOfset, productTitle: ImageModel.productTitle, foodTitleFSize: ImageModel.foodTitleFSize)
        }
    }
}

struct GrilledFilletCommonRequests: View{
    @ObservedObject var GrilledFilletCrVM = GrilledFilletCommonRequestsVM()
    @EnvironmentObject var GrilledFilletData: GrilledFilletDataVM

    var body: some View{
        ForEach(GrilledFilletCrVM.GrilledFilletCommonRequest) { CommonRequestModel in
            CommonRequestReusable(HForNUM: CommonRequestModel.HForNUM, n1: CommonRequestModel.n1, n2: CommonRequestModel.n2, n3: CommonRequestModel.n3, o1: GrilledFilletData.GrilledFilleto1, o2: GrilledFilletData.GrilledFilleto2, o3: GrilledFilletData.GrilledFilleto3, sliderValue: GrilledFilletData.sliderValue, function1: GrilledFilletData.o1True, function2: GrilledFilletData.o2True, function3: GrilledFilletData.o3True, functionH: GrilledFilletData.notHF, functionF: GrilledFilletData.notHF)
        }
    }
}


struct GrilledFilletSlider: View{
    @EnvironmentObject var GrilledFilletData: GrilledFilletDataVM
    var body: some View{
        sliderReusable(SliderProduct: GrilledFilletData.product, stepCount: GrilledFilletData.stepCount, range: 24, sliderAmount: $GrilledFilletData.sliderValue)
    }
}

struct GrilledFilletPopup_Previews: PreviewProvider {
    static var previews: some View {
        GrilledFilletPopup()
            .environmentObject(FilletDataVM())
            .environmentObject(GrilledFilletDataVM())
            .environmentObject(LineViewModel())
        
    }
}
