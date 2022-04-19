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
    
    func close(){
        LineItems.GrilledNuggetPopup = false 
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
            GrilledNuggetImgage()
            Text("Quick Select")
                .font(.title)
            GrilledNuggetCommonRequests()
//            GrilledNuggetSlider()
            Button(action: {
                LineItems.ShowRequestOptions = false
                GrilledNuggetData.MultiBatch()
                GrilledNuggetData.sendRequest()
                LineItems.GrilledNuggetPopup.toggle()
                Requests.updateRequestData(RequestUpdate: RequestModel(id: GrilledNuggetData.variableID, productRequested: true, amountRequested: String(GrilledNuggetData.FinalValue), productImage: "Grilled Nuggets", productTitle: "Grilled Nuggets", SecondRequested: totalSeconds()), updateAmount: String(GrilledNuggetData.FinalValue), CurrentTime: totalSeconds())
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

struct GrilledNuggetImgage: View{
    @ObservedObject var GrilledNuggetImVM = GrilledNuggetImageVM()
    var body: some View{
        ForEach(GrilledNuggetImVM.GrilledNuggetImage) { ImageModel in
            imageReusable(Rectanglewidth: 375, Rectangleheight: 375, productImage: ImageModel.productImage, ImageW: 350, ImageH: 350, xOfset: ImageModel.xOfset, yOfset: -40, productTitle: "Grilled Nuggets", foodTitleFSize: ImageModel.foodTitleFSize)
        }
    }
}

struct GrilledNuggetCommonRequests: View{
    @ObservedObject var GrilledNuggetCrVM = GrilledNuggetCommonRequestsVM()
    @EnvironmentObject var GrilledNuggetData: GrilledNuggetDataVM

    var body: some View{
        ForEach(GrilledNuggetCrVM.GrilledNuggetCommonRequest) { CommonRequestModel in
            CommonRequestReusable(HForNUM: CommonRequestModel.HForNUM, n1: CommonRequestModel.n1, n2: CommonRequestModel.n2, n3: CommonRequestModel.n3, o1: GrilledNuggetData.GrilledNuggeto1, o2: GrilledNuggetData.GrilledNuggeto2, o3: GrilledNuggetData.GrilledNuggeto3, o4: GrilledNuggetData.GrilledNuggeto4, oH: GrilledNuggetData.GrilledNuggetoH, oF: GrilledNuggetData.GrilledNuggetoF, sliderValue: GrilledNuggetData.sliderValue, function1: GrilledNuggetData.o1True, function2: GrilledNuggetData.o2True, function3: GrilledNuggetData.o3True, function4: GrilledNuggetData.LeanBatch, functionH: GrilledNuggetData.Half, functionF: GrilledNuggetData.Full)
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
