//
//  TestCombinedView.swift
//  Heard-v2
//
//  Created by Zachary Walsh on 3/14/22.
//

import SwiftUI



struct TestCombinedView: View {
    func test() -> Bool{
        return true
    }
    
    @State var showingRequestOptions: Bool = false
    
    @EnvironmentObject var LineItems: LineViewModel

    var body: some View {
            ZStack {
                MasterRequest2()
                    .tabItem {
                        Image(systemName: "checkmark.shield.fill")
                        Text("Current Requests")
                    }
                    .ignoresSafeArea()
                VStack{
                    Spacer()
                    HStack{
//                        Spacer()
//                        Button(action: {
//                            LineItems.ShowRequestOptions = true
//                        }, label: {
//                            plusButton()
//                        })
                    }
                }
                .frame(width: 700, height: 1000)
            }
//            .popup(isPresented: $LineItems.ShowRequestOptions) {
//                Line_Secondary()
//            }

        if LineItems.ShowRequestOptions == true {
            Line_Secondary()
        }
    }
}

struct TestCombinedView2: View {
    var body: some View {
        TabView {
            MasterRequest2()
                .tabItem {
                    Image(systemName: "checkmark.shield.fill")
                    Text("Current Requests")
                }
            Line_Secondary()
                .tabItem {
                    Image(systemName: "plus")
                    Text("New Request")
                }
        }
        .ignoresSafeArea()
    }
}


struct plusButton: View{
    var circleDimensions: CGFloat = 70
    var body: some View{
        Circle()
//            .strokeBorder(Color.white, lineWidth: 0.1)
            .frame(width: circleDimensions, height: circleDimensions)
            .foregroundColor(Color.black)
            .padding()
            .overlay(
                Image(systemName: "plus")
                    .resizable()
                    .frame(width: 30 , height: 30)
                    .foregroundColor(.white)
    
            )
    }
}

struct backButton: View{
    var circleDimensions: CGFloat = 60
    var body: some View{
        Circle()
            .frame(width: circleDimensions, height: circleDimensions)
            .foregroundColor(Color.FiletBlue)
            .overlay(
                Image(systemName: "arrow.backward")
                    .resizable()
                    .frame(width: 30 , height: 30)
                    .foregroundColor(.white)
            )
    }
}


struct TestCombinedView_Previews: PreviewProvider {
    static var previews: some View {
        TestCombinedView()
            .environmentObject(LineViewModel())
    }
}
