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
    var modifier: CGFloat =  0.65
    
    var frameW: CGFloat {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return 550 * modifier
        }else {
            return 550
        }
    }
    
    var frameH: CGFloat {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return 900 * modifier
        }else {
            return 900
        }
    }
    func close() {
        LineItems.FilletPopup = false
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
            filletImgage()
            Text("Quick Select")
                .font(.title)
            filletCommonRequests()
//            filletSlider()
                Button(action: {
                    LineItems.ShowRequestOptions = false
                    FilletData.MultiBatch()
                    FilletData.sendRequest()
                    LineItems.FilletPopup.toggle()
                    Requests.updateRequestData(RequestUpdate: RequestModel(id: FilletData.variableID, productRequested: true, amountRequested: String(FilletData.FinalValue), productImage: "Fillets", productTitle: "Fillets", SecondRequested: totalSeconds()), updateAmount: String(FilletData.FinalValue), CurrentTime: totalSeconds())
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
        .frame(width: frameW, height: frameH, alignment: .center)
        .background(Color.white)
        .cornerRadius(40)
        .shadow(radius: 3)

    }
}

struct filletImgage: View{
    @ObservedObject var FilletImVM = FilletImageVM()
    
    var modifier: CGFloat =  0.55
    
    var Rectangle: CGFloat {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return 400 * modifier
        }else {
            return 400
        }
    }
    
    var Image: CGFloat {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return 500 * modifier
        }else {
            return 500
        }
    }
    
    var body: some View{
        ForEach(FilletImVM.FilletImage) { ImageModel in
            imageReusable(Rectanglewidth: 400, Rectangleheight: 400, productImage: ImageModel.productImage, ImageW: 350, ImageH: 350, xOfset: ImageModel.xOfset, yOfset: ImageModel.yOfset, productTitle: ImageModel.productTitle, foodTitleFSize: ImageModel.foodTitleFSize)
        }
    }
}

struct filletCommonRequests: View{
    @ObservedObject var FilletCrVM = FilletCommonRequestsVM()
    @EnvironmentObject var FilletData: FilletDataVM
    @ObservedObject var Requests = RequestViewModel()

    var body: some View{
        ForEach(FilletCrVM.FilletCommonRequest) { CommonRequestModel in
            CommonRequestReusable(HForNUM: CommonRequestModel.HForNUM, n1: CommonRequestModel.n1, n2: CommonRequestModel.n2, n3: CommonRequestModel.n3, o1: FilletData.Filleto1, o2: FilletData.Filleto2, o3: FilletData.Filleto3, o4: FilletData.Filleto4, oH: false, oF: true, sliderValue: FilletData.sliderValue, function1: FilletData.o1True, function2: FilletData.o2True, function3: FilletData.o3True, function4: FilletData.o4True, functionH: FilletData.notHF, functionF: FilletData.notHF)
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
