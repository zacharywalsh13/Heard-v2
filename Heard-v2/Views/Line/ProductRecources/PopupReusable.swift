//
//  PopupReusable.swift
//  Heard-v2
//
//  Created by Zachary Walsh on 1/25/22.
//

import SwiftUI

struct imageReusable: View{
    var Rectanglewidth: CGFloat
    var Rectangleheight: CGFloat
    var productImage: String
    var ImageW: CGFloat
    var ImageH: CGFloat
    var xOfset: CGFloat
    var yOfset: CGFloat
    var productTitle: String
    var foodTitleFSize: CGFloat
    var body: some View {
        Rectangle()
            .frame(width: Rectanglewidth, height: Rectangleheight, alignment: .center)
            .foregroundColor(Color.lightGray)
            .cornerRadius(50)
            .overlay(
                Image(productImage)
                    .resizable()
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    .frame(width: ImageW, height: ImageH, alignment: .center)
                    .offset(x: xOfset, y: yOfset)
            )
            .overlay(
                Text(productTitle)
                    .bold()
                    .padding()
                    .font(.system(size: foodTitleFSize))
                    .foregroundColor(.FontBlue)
                ,alignment: .bottom
            )
    }
}

struct CommonRequestReusable: View{
    var HForNUM: String
    var n1: Int
    var n2: Int
    var n3: Int
    var o1: Bool
    var o2: Bool
    var o3: Bool
    var sliderValue: Double
    var function1: () -> Void
    var function2: () -> Void
    var function3: () -> Void
    var functionH: () -> Void
    var functionF: () -> Void
    
    var body: some View{
        if HForNUM == "NUM" {
            HStack{
            Button(action: {
                function1()
            }, label: {
                Text("\(n1)")
                    .modifier(BatchSelectorMods(amount: n1, n1: n1, n2: n2, n3: n3, o1: o1, o2: o2, o3: o3, SliderValue: sliderValue))
            })
            Button(action: {
                function2()
            }, label: {
                Text("\(n2)")
                    .modifier(BatchSelectorMods(amount: n2, n1: n1, n2: n2, n3: n3, o1: o1, o2: o2, o3: o3, SliderValue: sliderValue))
            })
            Button(action: {
                function3()
            }, label: {
                Text("\(n3)")
                    .modifier(BatchSelectorMods(amount: n3, n1: n1, n2: n2, n3: n3, o1: o1, o2: o2, o3: o3, SliderValue: sliderValue))
            })
            }
        }
        if HForNUM == "HF" {
            HStack{
            Button(action: {
                functionH()
            }, label: {
                Text("Half Batch")
                    .foregroundColor(Color.black)
                    .frame(width: 205, height: 75, alignment: .center)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.black, lineWidth: 2)
                    )
            })
            Button(action: {
                functionF()
            }, label: {
                Text("Full Batch")
                    .foregroundColor(Color.black)
                    .frame(width: 205, height: 75, alignment: .center)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.black, lineWidth: 2)
                    )
            })
            }
        }
    }
}

struct sliderReusable: View{
    var SliderProduct: String
    var stepCount: Double
    var range: Double
    @Binding var sliderAmount: Double
    var body: some View{
        VStack{
        Text("OR")
            .bold()
        
        Text("\(sliderAmount, specifier: "%.0f") \(SliderProduct)")
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        
        
        Slider(value: $sliderAmount, in: 0...range, step: stepCount)
            .padding()
            .frame(width: 360, height: 75, alignment: .center)
            .accentColor(Color.Cred)
            .overlay(
                RoundedRectangle(cornerRadius: 15.0)
                    .stroke(lineWidth: 2.0)
                    .foregroundColor(Color.Cred)
            )
        }
    }
}

struct sendButtonReusable: View{
    var funcSend: ()
    var body: some View{
        Button(action: {
            funcSend
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
}


struct BatchSelectorMods: ViewModifier {
    var amount: Int
    var n1: Int
    var n2: Int
    var n3: Int
    var o1: Bool
    var o2: Bool
    var o3: Bool
    var SliderValue: Double
    
    func body(content: Content) -> some View {
        
        if SliderValue > 0{
            content
                
                .frame(width: 120, height: 75, alignment: .center)
                .foregroundColor(Color.black)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .overlay(
                    RoundedRectangle(cornerRadius: 15.0)
                        .stroke(lineWidth: 2.0)
                        .foregroundColor(Color.black)
                )    }
        else {
            if amount == n1 {
                content
                    .frame(width: 120, height: 75, alignment: .center)
                    .foregroundColor(o1 ? Color.Cred : Color.black)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15.0)
                            .stroke(lineWidth: 2.0)
                            .foregroundColor(o1 ? Color.Cred : Color.black)
                    )    }
            if amount == n2 {
                content
                    .frame(width: 120, height: 75, alignment: .center)
                    .foregroundColor(o2 ? Color.Cred : Color.black)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15.0)
                            .stroke(lineWidth: 2.0)
                            .foregroundColor(o2 ? Color.Cred : Color.black)
                    )    }
            if amount == n3 {
                content
                    .frame(width: 120, height: 75, alignment: .center)
                    .foregroundColor(o3 ? Color.Cred : Color.black)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15.0)
                            .stroke(lineWidth: 2.0)
                            .foregroundColor(o3 ? Color.Cred : Color.black)
                    )    }
        }
    }
}
