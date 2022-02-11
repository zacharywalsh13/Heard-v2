//
//  NuggetPopup.swift
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

struct NuggetPopup: View{
    @EnvironmentObject var NuggetData: NuggetDataVM
    @EnvironmentObject var LineItems: LineViewModel
    @ObservedObject var Requests = RequestViewModel()
    
    var body: some View {
        VStack(spacing: 20){
            NuggetImgage()
            Text("How many?")
                .font(.title)
            NuggetCommonRequests()
            NuggetSlider()
            Button(action: {
                NuggetData.MultiBatch()
                NuggetData.sendRequest()
                LineItems.NuggetPopup.toggle()
                Requests.updateRequestData(RequestUpdate: RequestModel(id: NuggetData.variableID, productSeconds: 0, productRequested: true, amountRequested: String(NuggetData.FinalValue), productImage: "nuggetsimg", productTitle: "Nuggets"), updateAmount: String(NuggetData.FinalValue), time: 0)
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

struct NuggetImgage: View{
    @ObservedObject var NuggetImVM = NuggetImageVM()
    var body: some View{
        ForEach(NuggetImVM.NuggetImage) { ImageModel in
            imageReusable(Rectanglewidth: ImageModel.Rectanglewidth, Rectangleheight: ImageModel.Rectangleheight, productImage: ImageModel.productImage, ImageW: ImageModel.ImageW, ImageH: ImageModel.ImageH, xOfset: ImageModel.xOfset, yOfset: ImageModel.yOfset, productTitle: ImageModel.productTitle, foodTitleFSize: ImageModel.foodTitleFSize)
        }
    }
}

struct NuggetCommonRequests: View{
    @ObservedObject var NuggetCrVM = NuggetCommonRequestsVM()
    @EnvironmentObject var NuggetData: NuggetDataVM

    var body: some View{
        ForEach(NuggetCrVM.NuggetCommonRequest) { CommonRequestModel in
            CommonRequestReusable(HForNUM: CommonRequestModel.HForNUM, n1: CommonRequestModel.n1, n2: CommonRequestModel.n2, n3: CommonRequestModel.n3, o1: NuggetData.Nuggeto1, o2: NuggetData.Nuggeto2, o3: NuggetData.Nuggeto3, sliderValue: NuggetData.sliderValue, function1: NuggetData.o1True, function2: NuggetData.o2True, function3: NuggetData.o3True, functionH: NuggetData.notHF, functionF: NuggetData.notHF)
        }
    }
}


struct NuggetSlider: View{
    @EnvironmentObject var NuggetData: NuggetDataVM
    var body: some View{
        sliderReusable(SliderProduct: NuggetData.product, stepCount: NuggetData.stepCount, range: 24, sliderAmount: $NuggetData.sliderValue)
    }
}

struct NuggetPopup_Previews: PreviewProvider {
    static var previews: some View {
        NuggetPopup()
            .environmentObject(FilletDataVM())
            .environmentObject(NuggetDataVM())
            .environmentObject(LineViewModel())
        
    }
}
