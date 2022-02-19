//
//  FilletPopup.swift
//  Heard-v2
//
//  Created by Zachary Walsh on 1/25/22.
//

import SwiftUI

struct FilletPopup: View{
    @EnvironmentObject var FilletData: FilletDataVM
    @EnvironmentObject var LineItems: LineViewModel
    @ObservedObject var Requests = RequestViewModel()
    
   
    
    var body: some View {
        VStack(spacing: 20){
            filletImgage()
            Text("How many?")
                .font(.title)
            filletCommonRequests()
            filletSlider()
                Button(action: {
                    FilletData.MultiBatch()
                    FilletData.sendRequest()
                    LineItems.FilletPopup.toggle()
                    Requests.updateRequestData(RequestUpdate: RequestModel(id: FilletData.variableID, productSeconds: 0, productRequested: true, amountRequested: String(FilletData.FinalValue), productImage: "filletimg", productTitle: "Fillets"), updateAmount: String(FilletData.FinalValue))
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

struct filletImgage: View{
    @ObservedObject var FilletImVM = FilletImageVM()
    var body: some View{
        ForEach(FilletImVM.FilletImage) { ImageModel in
            imageReusable(Rectanglewidth: ImageModel.Rectanglewidth, Rectangleheight: ImageModel.Rectangleheight, productImage: ImageModel.productImage, ImageW: ImageModel.ImageW, ImageH: ImageModel.ImageH, xOfset: ImageModel.xOfset, yOfset: ImageModel.yOfset, productTitle: ImageModel.productTitle, foodTitleFSize: ImageModel.foodTitleFSize)
        }
    }
}

struct filletCommonRequests: View{
    @ObservedObject var FilletCrVM = FilletCommonRequestsVM()
    @EnvironmentObject var FilletData: FilletDataVM
    @ObservedObject var Requests = RequestViewModel()

    var body: some View{
        ForEach(FilletCrVM.FilletCommonRequest) { CommonRequestModel in
            CommonRequestReusable(HForNUM: CommonRequestModel.HForNUM, n1: CommonRequestModel.n1, n2: CommonRequestModel.n2, n3: CommonRequestModel.n3, o1: FilletData.Filleto1, o2: FilletData.Filleto2, o3: FilletData.Filleto3, oH: false, oF: true, sliderValue: FilletData.sliderValue, function1: FilletData.o1True, function2: FilletData.o2True, function3: FilletData.o3True, functionH: FilletData.notHF, functionF: FilletData.notHF)
        }
    }
}


struct filletSlider: View{
    @EnvironmentObject var FilletData: FilletDataVM
    var test: ()
    var body: some View{
        sliderReusable(SliderProduct: FilletData.product, stepCount: FilletData.stepCount, range: 24, sliderAmount: $FilletData.sliderValue)
    }
}

struct FilletPopup_Previews: PreviewProvider {
    static var previews: some View {
        FilletPopup()
            .environmentObject(FilletDataVM())
            .environmentObject(LineViewModel())
    }
}
