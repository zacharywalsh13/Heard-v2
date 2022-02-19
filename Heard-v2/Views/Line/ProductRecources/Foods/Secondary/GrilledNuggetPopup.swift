//
//  GrilledNuggetPopup.swift
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

struct GrilledNuggetPopup: View{
    @EnvironmentObject var GrilledNuggetData: GrilledNuggetDataVM
    @EnvironmentObject var LineItems: LineViewModel
    @ObservedObject var Requests = RequestViewModel()
    
    var body: some View {
        VStack(spacing: 20){
            GrilledNuggetImgage()
            Text("How many?")
                .font(.title)
            GrilledNuggetCommonRequests()
            GrilledNuggetSlider()
            Button(action: {
                GrilledNuggetData.MultiBatch()
                GrilledNuggetData.sendRequest()
                LineItems.GrilledNuggetPopup.toggle()
                Requests.updateRequestData(RequestUpdate: RequestModel(id: GrilledNuggetData.variableID, productSeconds: 0, productRequested: true, amountRequested: String(GrilledNuggetData.FinalValue), productImage: "GrilledNuggetsimg", productTitle: "GrilledNuggets"), updateAmount: String(GrilledNuggetData.FinalValue))
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

struct GrilledNuggetImgage: View{
    @ObservedObject var GrilledNuggetImVM = GrilledNuggetImageVM()
    var body: some View{
        ForEach(GrilledNuggetImVM.GrilledNuggetImage) { ImageModel in
            imageReusable(Rectanglewidth: ImageModel.Rectanglewidth, Rectangleheight: ImageModel.Rectangleheight, productImage: ImageModel.productImage, ImageW: ImageModel.ImageW, ImageH: ImageModel.ImageH, xOfset: ImageModel.xOfset, yOfset: ImageModel.yOfset, productTitle: ImageModel.productTitle, foodTitleFSize: ImageModel.foodTitleFSize)
        }
    }
}

struct GrilledNuggetCommonRequests: View{
    @ObservedObject var GrilledNuggetCrVM = GrilledNuggetCommonRequestsVM()
    @EnvironmentObject var GrilledNuggetData: GrilledNuggetDataVM

    var body: some View{
        ForEach(GrilledNuggetCrVM.GrilledNuggetCommonRequest) { CommonRequestModel in
            CommonRequestReusable(HForNUM: CommonRequestModel.HForNUM, n1: CommonRequestModel.n1, n2: CommonRequestModel.n2, n3: CommonRequestModel.n3, o1: GrilledNuggetData.GrilledNuggeto1, o2: GrilledNuggetData.GrilledNuggeto2, o3: GrilledNuggetData.GrilledNuggeto3, oH: GrilledNuggetData.GrilledNuggetoH, oF: GrilledNuggetData.GrilledNuggetoF, sliderValue: GrilledNuggetData.sliderValue, function1: GrilledNuggetData.o1True, function2: GrilledNuggetData.o2True, function3: GrilledNuggetData.o3True, functionH: GrilledNuggetData.Half, functionF: GrilledNuggetData.Full)
        }
    }
}


struct GrilledNuggetSlider: View{
    @EnvironmentObject var GrilledNuggetData: GrilledNuggetDataVM
    var body: some View{
        sliderReusable(SliderProduct: GrilledNuggetData.product, stepCount: GrilledNuggetData.stepCount, range: 12, sliderAmount: $GrilledNuggetData.sliderValue)
    }
}

struct GrilledNuggetPopup_Previews: PreviewProvider {
    static var previews: some View {
        GrilledNuggetPopup()
            .environmentObject(FilletDataVM())
            .environmentObject(GrilledNuggetDataVM())
            .environmentObject(LineViewModel())
        
    }
}
