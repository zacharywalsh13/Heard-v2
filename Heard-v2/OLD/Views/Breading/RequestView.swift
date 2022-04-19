
//  MasterRequest2.swift
//  Heard!
//
//  Created by Zachary Walsh on 12/26/21.
//

import SwiftUI
import AVFoundation

struct MasterRequest2: View {
    
    @ObservedObject var Requests = RequestViewModel()
    @ObservedObject var Formating = RequestFormatingViewModel()
    @EnvironmentObject var Timers: RequestTimers
    @EnvironmentObject var LineItems: LineViewModel

    @State var Second = Date().second
    @State var Minute = Date().minute
    @State var Hour = Date().hour
    
    func totalSeconds() -> Int {
        let components = Calendar.current.dateComponents([.hour, .second, .minute], from: Date())
        
        let currentHour = components.hour ?? 0
        let currentMinute = components.minute ?? 0
        let currentSecond = components.second ?? 0
        
        let totalSeconds = (currentSecond) + (currentMinute * 60) + (currentHour * 3600)
        
        return Int(totalSeconds)
    }
    
    func updatedTime(RequestedTime: Int, CurrentTime: Int) -> Int {
        return 1
    }
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    VStack {
                        Text("Active Requests")
                            .bold()
                            .font(.system(size: Formating.RequestFont))
//                            .padding(.top, 40)
                            .padding(.leading, 32)
//                            .padding(.top, 20)
                            .offset(y: 15)
                    }
                    Spacer()
                    Button(action: {
                        LineItems.ShowRequestOptions = true
                    }, label: {
                        plusButton()
                    })
                        .padding(.trailing, 22)
                        .offset(y: 15)
                }
                ForEach(Requests.Request) { item in
                    if item.productRequested == true{
                        HStack(){
                            Circle()
                                .foregroundColor(.lightGray)
                                .frame(width: Formating.ImageCircleWH, height: Formating.ImageCircleWH, alignment: .center)
                            //                            .padding(2.5)
                                .overlay(
                                    Image(item.productImage)
                                        .resizable()
                                        .frame(width: Formating.RequestImageWH, height: Formating.RequestImageWH, alignment: .center)
                                        .offset(x: 0, y: 0)
                                )
                            VStack {
                                Text(item.productImage)
                                    .bold()
                                    .font(.system(size: Formating.ProductTitleFont))
                                Text("\(item.amountRequested)")
                                    .bold()
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            }
                            .frame(width: Formating.ProductAmountFrameW, height: Formating.ProductAmountFrameH, alignment: .center)
                            
                            RoundedRectangle(cornerRadius: Formating.TimerCornerRadius, style: .continuous)
                                .frame(width: Formating.TimerFrameW, height: Formating.TimerFrameH, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .foregroundColor(.lightGray)
                                .overlay(
//                                    Text("\((((totalSeconds()) - (item.SecondRequested)) % 3600) / 60) : \((((totalSeconds()) - (item.SecondRequested)) % 60))")
//
                                    Text("\(((((Hour * 3600) + (Minute * 60) + (Second)) - (item.SecondRequested)) % 3600) / 60):\(((((Hour * 3600) + (Minute * 60) + (Second)) - (item.SecondRequested)) % 60), specifier: "%.02d")")
                                        .bold()
                                        .font(.system(size: Formating.TimerFont))
                                )
                                .onAppear(){
                                    
                                }
                            
                            Button(action: {
                                Requests.DEupdateRequestData(RequestUpdate: RequestModel(id: item.id, productRequested: item.productRequested, amountRequested: item.amountRequested, productImage: item.productImage, productTitle: item.productTitle, SecondRequested: item.SecondRequested))
                            }
                                   , label: {
                                Text("Heard!")
                                    .bold()
                                    .frame(width: Formating.HeardButtonFrameW, height: Formating.HeardButtonFrameH, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .background(Color.FiletBlue)
                                    .cornerRadius(Formating.HeardButtonCornerRadius)
                                    .foregroundColor(.white)
                                    .font(.system(size: 46))
                            })
                        }
                    }
                }
                .frame(width: Formating.RequestTemplateW, height: Formating.RequestTemplateH)
                .background(Color.reallyLightGrey)
                .cornerRadius(Formating.RequestTemplateCornerRadius)
                
                Spacer()
            }
        }
        .onAppear(){
            SecondLogic()
            MinuteLogic()
            HourLogic()
        }
    }
    init() {
        Requests.getData()
        
    }
    func SecondLogic(){
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true ) {
            timer in
            Second = Second + 1
        }
    }
    
    func MinuteLogic(){
        
        Timer.scheduledTimer(withTimeInterval: 60, repeats: true ) {
            timer in
            Minute = Minute + 1
        }
    }
    
    func HourLogic(){
        
        Timer.scheduledTimer(withTimeInterval: 3600, repeats: true ) {
            timer in
            Hour = Hour + 1
        }
    }
    
}

struct timer: View {
    @State var time: Int = 0
    @ObservedObject var Formating = RequestFormatingViewModel()
    @EnvironmentObject var Timers: RequestTimers
    
    func timerLogic(){
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true ) {
            timer in
            time = time + 1
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
    
    var body: some View{
        VStack {
            Text("\((time % 3600) / 60):\(time % 60, specifier: "%.02d")")
                .bold()
                .font(.system(size: Formating.TimerFont))
        }
        .onAppear(){
            //            timerLogic()
        }
        
    }
}

struct timerLogicTests: View {
    @State var currentDate = Date().second
    
    var body: some View {
        VStack{
            Text("\(currentDate)")
                .onAppear(perform: timerLogic)
        }
    }
    func timerLogic(){
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true ) {
            timer in
            currentDate = currentDate + 1
        }
    }
    
}
struct Requestr_Previews: PreviewProvider {
    static var previews: some View {
                MasterRequest2()
//        timerLogicTests()
    }
}
