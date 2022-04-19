////
////  CurrentRequestView.swift
////  Heard-v2
////
////  Created by Zachary Walsh on 4/6/22.
////
//import SwiftUI
//import AVFoundation
//
//struct CurrentRequestView: View {
//    
//    @ObservedObject var Requests = CurrentRequestViewModel()
//    @ObservedObject var Formating = CurrentRequestFormatingViewModel()
//    
//    var body: some View {
//        ZStack {
//            AllRequests()
//            VStack{
//                Spacer()
//                HStack{
//                    Spacer()
//                    plusButton()
//                }
//            }
//            .frame(width: 650, height: 900)
//        }
//    }
//    init() {
//        Requests.getData()
//    }
//}
//
//struct Timer2: View {
//    @State var time: Int = 0
//    @ObservedObject var Formating = RequestFormatingViewModel()
//    func timerLogic(){
//        
//        Timer.scheduledTimer(withTimeInterval: 1, repeats: true ) {
//            timer in
//            time = time + 1
//        }
//    }
//    var body: some View{
//        VStack {
//            Text("\((time % 3600) / 60):\(time % 60, specifier: "%.02d")")
//                .bold()
//                .font(.system(size: Formating.TimerFont))
//        }
//        .onAppear(){
//            timerLogic()
//        }
//        
//    }
//}
//
//struct CurrentRequestItems: View {
//    
//    @ObservedObject var Requests = CurrentRequestViewModel()
//    @ObservedObject var Formating = CurrentRequestFormatingViewModel()
//    
//    var body: some View {
//        ForEach(Requests.Request) { item in
//            if item.productRequested == true{
//                HStack(){
//                    Circle()
//                        .foregroundColor(.lightGray)
//                        .frame(width: Formating.ImageCircleWH, height: Formating.ImageCircleWH, alignment: .center)
//                        .overlay(
//                            Image(item.productImage)
//                                .resizable()
//                                .frame(width: Formating.RequestImageWH, height: Formating.RequestImageWH, alignment: .center)
//                                .offset(x: 0, y: 0)
//                        )
//                    VStack {
//                        Text(item.productTitle)
//                            .bold()
//                            .font(.system(size: Formating.ProductTitleFont))
//                        Text("\(item.amountRequested)")
//                            .bold()
//                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
//                    }
//                    .frame(width: Formating.ProductAmountFrameW, height: Formating.ProductAmountFrameH, alignment: .center)
//                    
//                    RoundedRectangle(cornerRadius: Formating.TimerCornerRadius, style: .continuous)
//                        .frame(width: Formating.TimerFrameW, height: Formating.TimerFrameH, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                        .foregroundColor(.lightGray)
//                        .overlay(
//                            Timer2()
//                        )
//                        .onAppear(){
//                            AudioServicesPlaySystemSound(1026)
//                        }
//                    
//                    Button(action: {
//                        Requests.DEupdateRequestData(RequestUpdate: RequestModel(id: item.id, productRequested: item.productRequested, amountRequested: item.amountRequested, productImage: item.productImage, productTitle: item.productTitle))
//                    }
//                           , label: {
//                        Text("Heard?")
//                            .bold()
//                            .frame(width: Formating.HeardButtonFrameW, height: Formating.HeardButtonFrameH, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                            .background(Color.Corange)
//                            .cornerRadius(Formating.HeardButtonCornerRadius)
//                            .foregroundColor(.white)
//                            .font(.title2)
//                    })
//                }
//            }
//        }
//        .frame(width: Formating.RequestTemplateW, height: Formating.RequestTemplateH)
//        .background(Color.reallyLightGrey)
//        .cornerRadius(Formating.RequestTemplateCornerRadius)
//    }
//}
//
//struct RequestsText: View {
//    @ObservedObject var Formating = CurrentRequestFormatingViewModel()
//    var body: some View {
//        HStack {
//            Text("Requests")
//                .bold()
//                .font(.system(size: Formating.RequestFont))
//                .padding()
//        }
//    }
//}
//
//struct AllRequests: View {
//    var body: some View {
//        VStack {
//            RequestsText()
//            CurrentRequestItems()
//            Spacer()
//        }
//    }
//}
//
//
//
//struct CurrentRequestViewPreview: PreviewProvider {
//    static var previews: some View {
//        //        plusButton()
//        CurrentRequestView()
//    }
//}
//
//
