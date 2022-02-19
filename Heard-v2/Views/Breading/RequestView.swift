//
//  RequestView.swift
//  Heard-v2
//
//  Created by Zachary Walsh on 1/26/22.
//

//
//  MasterRequest2.swift
//  Heard!
//
//  Created by Zachary Walsh on 12/26/21.
//

import SwiftUI

struct MasterRequest2: View {
    
    @ObservedObject var Requests = RequestViewModel()
    @ObservedObject var Formating = RequestFormatingViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Text("Requests")
                    .bold()
                    .font(.system(size: Formating.RequestFont))
                    .padding()
            }
            ForEach(Requests.Request) { item in
                if item.productRequested == true{
                    HStack(){
                        Circle()
                            .foregroundColor(.Cred)
                            .frame(width: Formating.ImageCircleWH, height: Formating.ImageCircleWH, alignment: .center)
                            .padding(2.5)
                            .overlay(
                                Image(item.productImage)
                                    .resizable()
                                    .frame(width: Formating.RequestImageWH, height: Formating.RequestImageWH, alignment: .center)
                                    .offset(x: 0, y: 0)
                            )
                        VStack {
                            Text(item.productTitle)
                                .bold()
                                .font(.system(size: 40))
                            Text("\(item.amountRequested)")
                                .bold()
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        }
                        .frame(width: 160, height: 150, alignment: .center)
                        
                        RoundedRectangle(cornerRadius: 12.5, style: .continuous)
                            .frame(width: 200, height: 120, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.lightGray)
                            .padding()
                            .overlay(
                                timer()
                            )
                        
                        Button(action: {
                            Requests.DEupdateRequestData(RequestUpdate: RequestModel(id: item.id, productSeconds: item.productSeconds, productRequested: false, amountRequested: "", productImage: item.productImage, productTitle: item.productTitle))
                        }
                        , label: {
                            Text("Heard?")
                                .bold()
                                .frame(width: 200, height: 120, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .background(Color.Cred)
                                .cornerRadius(15)
                                .foregroundColor(.white)
                                .font(.title2)
                        })
                    }
                }
            }
                .frame(width: 770, height: 150)
                .background(Color.reallyLightGrey)
                .cornerRadius(15)

            Spacer()
        }
    }
    init() {
        Requests.getData()
    }
}

struct timer: View {
    @State var time: Int = 0
    func timerLogic(){
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true ) {
            timer in
            time = time + 1
        }
    }
    var body: some View{
        VStack {
            Text("\((time % 3600) / 60):\(time % 60, specifier: "%.02d")")
                .bold()
                .font(.system(size: 65))
        }
        
    }
}
struct Requestr_Previews: PreviewProvider {
    static var previews: some View {
        MasterRequest2()
    }
}
