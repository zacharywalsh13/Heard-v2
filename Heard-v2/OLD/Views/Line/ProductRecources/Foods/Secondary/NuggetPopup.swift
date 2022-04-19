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
    
    var sendW: CGFloat {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return 250 * 0.75
        }
        else{
            return 250
        }
    }
    var sendH: CGFloat {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return 75 * 0.75
        }
        else{
            return 75
        }
    }
    var FrameW: CGFloat {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return 550 * 0.75
        }
        else{
            return 550
        }
    }
    var FrameH: CGFloat {
            if UIDevice.current.userInterfaceIdiom == .phone {
                return 900 * 0.75
            }
            else{
                return 900
            }
        }
    var VStackSpacing: CGFloat {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return 20 * 0.75
        }
        else {
            return 20
        }
    }
    
    func totalSeconds() -> Int {
        let components = Calendar.current.dateComponents([.hour, .second, .minute], from: Date())

        let currentHour = components.hour ?? 0
        let currentMinute = components.minute ?? 0
        let currentSecond = components.second ?? 0
        
        let totalSeconds = (currentSecond) + (currentMinute * 60) + (currentHour * 3600)
        
        return Int(totalSeconds)
    }
    
    
    func close() {
        LineItems.NuggetPopup = false
    }
    
    var body: some View {
        VStack(spacing: 20){
            HStack {
                Button(action: {
                    LineItems.NuggetPopup = false
                }, label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .foregroundColor(Color.FiletBlue)
                        .frame(width: 30, height: 30)
            })
                    .padding(.leading, 50)
                Spacer()
            }
            NuggetImgage()
            Text("Quick Select")
                .font(.title)
            NuggetCommonRequests()
//            NuggetSlider()
            Button(action: {
                LineItems.ShowRequestOptions = false
                NuggetData.MultiBatch()
                NuggetData.sendRequest()
                LineItems.NuggetPopup.toggle()
                Requests.updateRequestData(RequestUpdate: RequestModel(id: NuggetData.variableID, productRequested: true, amountRequested: String(NuggetData.FinalValue), productImage: "Nuggets", productTitle: "Nuggets", SecondRequested: totalSeconds()), updateAmount: String(NuggetData.FinalValue), CurrentTime: totalSeconds())
            }, label: {
                Text("Send")
                    .bold()
                    .frame(width: sendW, height: sendH, alignment: .center)
                    .foregroundColor(.white)
                    .font(.title2)
                    .background(Color.FiletBlue)
                    .cornerRadius(25)
            })
        }
        .frame(width: FrameW, height: FrameH, alignment: .center)
        .background(Color.white)
        .cornerRadius(40)
        .shadow(radius: 3)
        Spacer()
    }
}

struct NuggetImgage: View{
    @ObservedObject var NuggetImVM = NuggetImageVM()
    var body: some View{
        ForEach(NuggetImVM.NuggetImage) { ImageModel in
            imageReusable(Rectanglewidth: 350, Rectangleheight: 350, productImage: ImageModel.productImage, ImageW: 450, ImageH: 450, xOfset: ImageModel.xOfset, yOfset: ImageModel.yOfset, productTitle: "Nuggets", foodTitleFSize: NuggetImVM.foodTitleFSize)
        }
    }
}

struct NuggetCommonRequests: View{
    @ObservedObject var NuggetCrVM = NuggetCommonRequestsVM()
    @EnvironmentObject var NuggetData: NuggetDataVM

    var body: some View{
        ForEach(NuggetCrVM.NuggetCommonRequest) { CommonRequestModel in
            CommonRequestReusable(HForNUM: CommonRequestModel.HForNUM, n1: CommonRequestModel.n1, n2: CommonRequestModel.n2, n3: CommonRequestModel.n3, o1: NuggetData.Nuggeto1, o2: NuggetData.Nuggeto2, o3: NuggetData.Nuggeto3, o4: NuggetData.Nuggeto4, oH: NuggetData.NuggetoH, oF: NuggetData.NuggetoF, sliderValue: NuggetData.sliderValue, function1: NuggetData.o1True, function2: NuggetData.o2True, function3: NuggetData.o3True, function4: NuggetData.LeanBatch, functionH: NuggetData.Half, functionF: NuggetData.Full)
        }
    }
}


struct NuggetSlider: View{
    @EnvironmentObject var NuggetData: NuggetDataVM
    var body: some View{
        sliderReusable(SliderProduct: "Cups", stepCount: NuggetData.stepCount, range: 12, sliderAmount: $NuggetData.sliderValue)
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
