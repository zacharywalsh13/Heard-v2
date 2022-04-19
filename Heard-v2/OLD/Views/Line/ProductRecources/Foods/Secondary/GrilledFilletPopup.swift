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
    
    func close() {
        LineItems.GrilledFilletPopup = false 
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
            GrilledFilletImgage()
            Text("Quick Select")
                .font(.title)
            GrilledFilletCommonRequests()
//            GrilledFilletSlider()
            Button(action: {
                LineItems.ShowRequestOptions = false
                GrilledFilletData.MultiBatch()
                GrilledFilletData.sendRequest()
                LineItems.GrilledFilletPopup.toggle()
                Requests.updateRequestData(RequestUpdate: RequestModel(id: GrilledFilletData.variableID, productRequested: true, amountRequested: String(GrilledFilletData.FinalValue), productImage: "Grilled Fillets", productTitle: "Grilled Fillets", SecondRequested: totalSeconds()), updateAmount: String(GrilledFilletData.FinalValue), CurrentTime: totalSeconds())
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

struct GrilledFilletImgage: View{
    @ObservedObject var GrilledFilletImVM = GrilledFilletImageVM()
    var body: some View{
        ForEach(GrilledFilletImVM.GrilledFilletImage) { ImageModel in
            imageReusable(Rectanglewidth: 350, Rectangleheight: 350, productImage: ImageModel.productImage, ImageW: 450, ImageH: 450, xOfset: ImageModel.xOfset, yOfset: ImageModel.yOfset, productTitle: "Grilled Fillets", foodTitleFSize: ImageModel.foodTitleFSize)
        }
    }
}

struct GrilledFilletCommonRequests: View{
    @ObservedObject var GrilledFilletCrVM = GrilledFilletCommonRequestsVM()
    @EnvironmentObject var GrilledFilletData: GrilledFilletDataVM

    var body: some View{
        ForEach(GrilledFilletCrVM.GrilledFilletCommonRequest) { CommonRequestModel in
            CommonRequestReusable(HForNUM: CommonRequestModel.HForNUM, n1: CommonRequestModel.n1, n2: CommonRequestModel.n2, n3: CommonRequestModel.n3, o1: GrilledFilletData.GrilledFilleto1, o2: GrilledFilletData.GrilledFilleto2, o3: GrilledFilletData.GrilledFilleto3, o4: GrilledFilletData.GrilledFilleto4, oH: false, oF: false, sliderValue: GrilledFilletData.sliderValue, function1: GrilledFilletData.o1True, function2: GrilledFilletData.o2True, function3: GrilledFilletData.o3True, function4: GrilledFilletData.o4True, functionH: GrilledFilletData.notHF, functionF: GrilledFilletData.notHF)
        }
    }
}


struct GrilledFilletSlider: View{
    @EnvironmentObject var GrilledFilletData: GrilledFilletDataVM
    var body: some View{
        sliderReusable(SliderProduct: "Grilled Fillets", stepCount: GrilledFilletData.stepCount, range: 24, sliderAmount: $GrilledFilletData.sliderValue)
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
