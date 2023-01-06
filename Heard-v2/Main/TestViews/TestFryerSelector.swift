//
//  TestFryerSelector.swift
//  Heard-v2
//
//  Created by Zachary Walsh on 3/31/22.
//

import SwiftUI

struct TestFryerSelector: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct sendButton: View{
    @ObservedObject var Formating = RequestFormatingViewModel()
    var body: some View{
        Text("Heard?")
            .bold()
            .frame(width: Formating.HeardButtonFrameW, height: Formating.HeardButtonFrameH, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(Color.FiletBlue)
            .cornerRadius(Formating.HeardButtonCornerRadius)
            .foregroundColor(.white)
            .font(.title2)
    }
}

struct FryerSelector: View {
    @ObservedObject var Formating = RequestFormatingViewModel()
    var body: some View{
        RoundedRectangle(cornerRadius: Formating.HeardButtonCornerRadius)
            .frame(width: Formating.HeardButtonFrameW, height: Formating.HeardButtonFrameH, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .foregroundColor(Color.FiletBlue)
            .overlay(
                VStack{
                    Text("Fryer?")
                        .bold()
                        .foregroundColor(.white)
                        .font(.title2)
                        .padding()
                    HStack{
                        
                    }
                    Spacer()
                }
            )
    }
}
    
struct TestFryerSelector_Previews: PreviewProvider {
    static var previews: some View {
        FryerSelector()
    }
}
