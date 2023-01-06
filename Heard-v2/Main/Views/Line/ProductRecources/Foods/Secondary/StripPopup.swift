
import SwiftUI

struct StripPopup: View{
    @EnvironmentObject var StripData: StripDataVM
    @EnvironmentObject var LineItems: LineViewModel
    @ObservedObject var Requests = RequestViewModel()
    
    func closeStrips() {
        LineItems.StripPopup.toggle()
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
                Button(action: {
                    LineItems.StripPopup.toggle()
                }, label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .foregroundColor(Color.FiletBlue)
                        .frame(width: 30, height: 30)
            })
                    .padding(.leading, 50)
                Spacer()
            }
            StripImgage()
            Text("Quick Select")
                .font(.title)
            StripCommonRequests()
//            StripSlider()
            Button(action: {
                LineItems.ShowRequestOptions = false
                StripData.MultiBatch()
                StripData.sendRequest()
                LineItems.StripPopup.toggle()
                Requests.updateRequestData(RequestUpdate: RequestModel(id: StripData.variableID, productRequested: true, amountRequested: String(StripData.FinalValue), productImage: "Strips", productTitle: "Strips", SecondRequested: totalSeconds()), updateAmount: String(StripData.FinalValue), CurrentTime: totalSeconds())
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

struct StripImgage: View{
    @ObservedObject var StripImVM = StripImageVM()
    var body: some View{
        ForEach(StripImVM.StripImage) { ImageModel in
            imageReusable(Rectanglewidth: 350, Rectangleheight: 350, productImage: ImageModel.productImage, ImageW: 420, ImageH: 420, xOfset: ImageModel.xOfset, yOfset: ImageModel.yOfset, productTitle: "Strips", foodTitleFSize: ImageModel.foodTitleFSize)
        }
    }
}

struct StripCommonRequests: View{
    @ObservedObject var StripCrVM = StripCommonRequestsVM()
    @EnvironmentObject var StripData: StripDataVM

    var body: some View{
        ForEach(StripCrVM.StripCommonRequest) { CommonRequestModel in
            CommonRequestReusable(HForNUM: CommonRequestModel.HForNUM, n1: CommonRequestModel.n1, n2: CommonRequestModel.n2, n3: CommonRequestModel.n3, o1: StripData.Stripo1, o2: StripData.Stripo2, o3: StripData.Stripo3, o4: StripData.Stripo4, oH: false,oF: false, sliderValue: StripData.sliderValue, function1: StripData.o1True, function2: StripData.o2True, function3: StripData.o3True, function4: StripData.o4True, functionH: StripData.notHF, functionF: StripData.notHF)
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
