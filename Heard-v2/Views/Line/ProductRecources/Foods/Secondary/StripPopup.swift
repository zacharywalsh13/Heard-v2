
import SwiftUI

struct StripPopup: View{
    @EnvironmentObject var StripData: StripDataVM
    @EnvironmentObject var LineItems: LineViewModel
    @ObservedObject var Requests = RequestViewModel()
    
    var body: some View {
        VStack(spacing: 20){
            StripImgage()
            Text("How many?")
                .font(.title)
            StripCommonRequests()
            StripSlider()
            Button(action: {
                StripData.MultiBatch()
                StripData.sendRequest()
                LineItems.StripPopup.toggle()
                Requests.updateRequestData(RequestUpdate: RequestModel(id: StripData.variableID, productSeconds: 0, productRequested: true, amountRequested: String(StripData.FinalValue), productImage: "Stripsimg", productTitle: "Strips"), updateAmount: String(StripData.FinalValue))
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

struct StripImgage: View{
    @ObservedObject var StripImVM = StripImageVM()
    var body: some View{
        ForEach(StripImVM.StripImage) { ImageModel in
            imageReusable(Rectanglewidth: ImageModel.Rectanglewidth, Rectangleheight: ImageModel.Rectangleheight, productImage: ImageModel.productImage, ImageW: ImageModel.ImageW, ImageH: ImageModel.ImageH, xOfset: ImageModel.xOfset, yOfset: ImageModel.yOfset, productTitle: ImageModel.productTitle, foodTitleFSize: ImageModel.foodTitleFSize)
        }
    }
}

struct StripCommonRequests: View{
    @ObservedObject var StripCrVM = StripCommonRequestsVM()
    @EnvironmentObject var StripData: StripDataVM

    var body: some View{
        ForEach(StripCrVM.StripCommonRequest) { CommonRequestModel in
            CommonRequestReusable(HForNUM: CommonRequestModel.HForNUM, n1: CommonRequestModel.n1, n2: CommonRequestModel.n2, n3: CommonRequestModel.n3, o1: StripData.Stripo1, o2: StripData.Stripo2, o3: StripData.Stripo3, oH: false,oF: false, sliderValue: StripData.sliderValue, function1: StripData.o1True, function2: StripData.o2True, function3: StripData.o3True, functionH: StripData.notHF, functionF: StripData.notHF)
        }
    }
}


struct StripSlider: View{
    @EnvironmentObject var StripData: StripDataVM
    var body: some View{
        sliderReusable(SliderProduct: StripData.product, stepCount: StripData.stepCount, range: 24, sliderAmount: $StripData.sliderValue)
    }
}

struct StripPopup_Previews: PreviewProvider {
    static var previews: some View {
        StripPopup()
            .environmentObject(FilletDataVM())
            .environmentObject(StripDataVM())
            .environmentObject(LineViewModel())
        
    }
}
