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
            .foregroundColor(Color.reallyLightGrey)
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
                    .foregroundColor(.black)
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
    var o4: Bool
    var oH: Bool
    var oF: Bool
    var sliderValue: Double
    var function1: () -> Void
    var function2: () -> Void
    var function3: () -> Void
    var function4: () -> Void
    var functionH: () -> Void
    var functionF: () -> Void
    
    var body: some View{
            if HForNUM == "NUM" {
                VStack(spacing: 20) {
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
                    Button(action: {
                        function4()
                    }, label: {
                        Text("Lean Batch")
                            .modifier(LeanBathcMod(LeanBatchBool: o4, frameW: 375))
                    })
                }
            } else {
                VStack(spacing: 20) {
                    HStack{
                        Button(action: {
                            functionH()
                        }, label: {
                            Text("Half Batch")
                                .modifier(BatchSelectorMods2(amount: "halfbag", oH: oH, oF: oF, sliderValue: sliderValue))
                        })
                        Button(action: {
                            functionF()
                        }, label: {
                            Text("Full Batch")
                                .modifier(BatchSelectorMods2(amount: "fullbag", oH: oH, oF: oF, sliderValue: sliderValue))
                            
                        })
                    }
                    Button(action: {
                        function4()
                    }, label: {
                        Text("Lean Batch")
                            .modifier(LeanBathcMod(LeanBatchBool: o4, frameW: 420))
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
            Text("")
                .bold()
            
            Text("\(sliderAmount, specifier: "%.0f") \(SliderProduct)")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            
            
            Slider(value: $sliderAmount, in: 0...range, step: stepCount)
                .modifier(SliderViewMod(sliderValue: $sliderAmount))
        }
    }
}

struct sendButtonReusable: View{
    var modifier: CGFloat =  0.75
    
    var frameW: CGFloat {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return 205 * modifier
        }else {
            return 205
        }
    }
    
    var frameH: CGFloat {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return 75 * modifier
        }else {
            return 75
        }
    }
    var funcSend: ()
    var body: some View{
        Button(action: {
            funcSend
        }, label: {
            Text("Send")
                .bold()
                .frame(width: frameW, height: frameH, alignment: .center)
                .foregroundColor(.white)
                .font(.title2)
                .background(Color.FiletBlue)
                .cornerRadius(25)
        })
        
        
    }
}

struct ClosePopup: View{
    var closeFunction: () -> Void
    var body: some View{
        VStack {
            Button(action: {
                closeFunction()
            }, label: {
                Image(systemName: "xmark")
                    .resizable()
                    .foregroundColor(Color.FiletBlue)
                    .frame(width: 30, height: 30)
            })
        }
    }
}
//
//struct PopupPreviews: PreviewProvider {
//    static var previews: some View {
//        ClosePopup()
//    }
//}


struct BatchSelectorMods: ViewModifier {
    var amount: Int
    var n1: Int
    var n2: Int
    var n3: Int
    var o1: Bool
    var o2: Bool
    var o3: Bool
    var SliderValue: Double
    
    var frameW: CGFloat {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return 120 * 0.75
        }
        else {
            return 120
        }
    }
    
    var frameH: CGFloat {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return 75 * 0.75
        }
        else {
            return 75
        }
    }
    
    func body(content: Content) -> some View {
        
        if SliderValue > 0{
            content
            
                .frame(width: frameW, height: frameH, alignment: .center)
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
                    .frame(width: frameW, height: frameH, alignment: .center)
                    .foregroundColor(o1 ? Color.FiletBlue : Color.black)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15.0)
                            .stroke(lineWidth: 2.0)
                            .foregroundColor(o1 ? Color.FiletBlue : Color.black)
                    )    }
            if amount == n2 {
                content
                    .frame(width: frameW, height: frameH, alignment: .center)
                    .foregroundColor(o2 ? Color.FiletBlue : Color.black)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15.0)
                            .stroke(lineWidth: 2.0)
                            .foregroundColor(o2 ? Color.FiletBlue : Color.black)
                    )    }
            if amount == n3 {
                content
                    .frame(width: frameW, height: frameH, alignment: .center)
                    .foregroundColor(o3 ? Color.FiletBlue : Color.black)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15.0)
                            .stroke(lineWidth: 2.0)
                            .foregroundColor(o3 ? Color.FiletBlue : Color.black)
                    )    }
        }
    }
}

struct BatchSelectorMods2: ViewModifier{
    var amount: String
    var oH: Bool
    var oF: Bool
    var sliderValue: Double
    var modifier: CGFloat =  0.75
    
    var frameW: CGFloat {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return 205 * modifier
        }else {
            return 205
        }
    }
    
    var frameH: CGFloat {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return 75 * modifier
        }else {
            return 75
        }
    }
    
    func body(content: Content) -> some View {
        if sliderValue > 0 {
            content
                .frame(width: frameW, height: frameH, alignment: .center)
                .foregroundColor(Color.black)
                .overlay(
                    RoundedRectangle(cornerRadius: 15.0)
                        .stroke(lineWidth: 2.0)
                        .foregroundColor(Color.black)
                )    }
        else {
            if amount == "halfbag" {
                content
                    .foregroundColor(oH ? Color.FiletBlue : Color.black)
                    .frame(width: frameW, height: frameH, alignment: .center)
                    .font(.title)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(oH ? Color.FiletBlue : Color.black, lineWidth: 2)
                    )
            }
            if amount == "fullbag" {
                content
                    .foregroundColor(oF ? Color.FiletBlue : Color.black)
                    .frame(width: frameW, height: frameH, alignment: .center)
                    .font(.title)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(oF ? Color.FiletBlue : Color.black, lineWidth: 2)
                    )
            }
        }
    }
}

struct SliderViewMod: ViewModifier {
    var modifier: CGFloat =  0.75
    
    var frameW: CGFloat {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return 360 * modifier
        }else {
            return 360
        }
    }
    
    var frameH: CGFloat {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return 75 * modifier
        }else {
            return 75
        }
    }
    
    
    @Binding var sliderValue: Double
    func body(content: Content) -> some View {
        if sliderValue == 0 {
            content
                .padding()
                .frame(width: frameW, height: frameH, alignment: .center)
                .accentColor(Color.black)
                .overlay(
                    RoundedRectangle(cornerRadius: 15.0)
                        .stroke(lineWidth: 2.0)
                        .foregroundColor(Color.black)
                )
        }
        if sliderValue > 0 {
            content
                .padding()
                .frame(width: frameW, height: frameH, alignment: .center)
                .accentColor(Color.FiletBlue)
                .overlay(
                    RoundedRectangle(cornerRadius: 15.0)
                        .stroke(lineWidth: 2.0)
                        .foregroundColor(Color.FiletBlue)
                )
        }
    }
}

struct LeanBathcMod: ViewModifier {
    var modifier: CGFloat =  0.75
    var LeanBatchBool: Bool
    var frameW: CGFloat
    var frameH: CGFloat {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return 75 * modifier
        }else {
            return 75
        }
    }
    
    func body(content: Content) -> some View {
        content
            .padding()
            .font(.title)
            .frame(width: frameW, height: frameH, alignment: .center)
            .foregroundColor(LeanBatchBool ? Color.FiletBlue : Color.black)
            .overlay(
                RoundedRectangle(cornerRadius: 15.0)
                    .stroke(lineWidth: 2.0)
                    .foregroundColor(LeanBatchBool ? Color.FiletBlue : Color.black)
            )
    }
}

