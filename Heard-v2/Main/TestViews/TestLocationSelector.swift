//
//  SwiftUIView.swift
//  Heard-v2
//
//  Created by Zachary Walsh on 3/7/22.
//

import SwiftUI
import UIKit

struct TestLocationSelector: View {
    var fontS: CGFloat {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return 100 * 0.7
        } else {
            return 100
        }
    }
    
    @State var navigationControl: String? = nil
    @State var onLine: Bool = false
    var body: some View {
        ZStack{
            welcomeBubble()
            HStack{
                VStack(){
                Text("Please Select a Location")
                    .bold()
                    .font(.system(size: 50))
                VStack(spacing: 30){
                    Button(action: {
                        if onLine == true {
                            self.navigationControl = "primary"
                        }else {
                        self.navigationControl = "breading"
                        }
                    }, label: {
                        if onLine == false {
                        Text("Breading")
                        .bold()
                        .font(.system(size: 50))
                        .frame(width: 500, height: 250)
                        .background(Color.lightGray)
                        .cornerRadius(75)
                        .foregroundColor(.black)
                        }
                        if onLine == true {
                            Text("Primary")
                            .bold()
                            .font(.system(size: 50))
                            .frame(width: 500, height: 250)
                            .background(Color.lightGray)
                            .cornerRadius(75)
                            .foregroundColor(.black)
                        }
                    })
                        .shadow(radius: 3)
                        .frame(width: 650, height: 250)
                        
                    
                    Button(action: {
                        if onLine == true {
                            self.navigationControl = "secondary"
                        }else {
                            self.onLine = true
                        }
                    }, label: {
                        if onLine == false {
                        Text("Line")
                        .bold()
                        .font(.system(size: 50))
                        .frame(width: 500, height: 250)
                        .background(Color.lightGray)
                        .cornerRadius(75)
                        .foregroundColor(.black)
                        }
                        if onLine == true {
                            Text("Secondary")
                            .bold()
                            .font(.system(size: 50))
                            .frame(width: 500, height: 250)
                            .background(Color.lightGray)
                            .cornerRadius(75)
                            .foregroundColor(.black)
                        }
                    })
                        .shadow(radius: 3)
                        .frame(width: 650, height: 250)
                    
                    .frame(width: 650, height: 250)
                }
            }
            .padding(.top, 300)
            .frame(width: 600, height: 600 )
        }
            .frame(width: 600, height: 600)
            
            Spacer()
            
            NavigationLink(destination: Line_Primary().navigationBarBackButtonHidden(true), tag: "primary", selection: $navigationControl) { EmptyView()
            }
            NavigationLink(destination: Line_Secondary().navigationBarBackButtonHidden(true), tag: "secondary", selection: $navigationControl) { EmptyView()
            }
            NavigationLink(destination: MasterRequest2().navigationBarBackButtonHidden(true), tag: "breading", selection: $navigationControl) { EmptyView()
            }
        }
        .ignoresSafeArea()
        .background(Color.reallyLightGrey)
       
    }
}
struct welcomeBubble: View {
    var fontS: CGFloat {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return 100 * 0.7
        } else {
            return 100
        }
    }
    var body: some View{
        VStack{
            HStack{
                Circle()
                    .frame(width: 1200, height: 1200)
                    .offset( x: -80, y: -800)
                    .foregroundColor(.FiletBlue)
                    .overlay(
                        VStack{
                            VStack{
                                Text("Welcome!")
                                    .bold()
                                    .foregroundColor(Color.white)
                                    .welcome()
                                    .font(Font.custom("Apercu Pro Bold", size: fontS))
                                    .padding(.top, 50)
                                    .padding(.trailing, 100)
  
                            }
                        }
                        ,
                        alignment: .top
                    )
            }
            
            Spacer()
            
        }
        .ignoresSafeArea()
        
       
    }
}
struct LocationSelectorTemplate: View {
    var name: String
    var color: Color
    var body: some View{
        Text(name)
            .foregroundColor(Color.FontBlue)
            .font(Font.custom("Apercu Pro Bold", size: 75))
            .frame(width: 700, height: 200)
            .background(color)
            .cornerRadius(50)
            .shadow(color: .gray, radius: 10)
        //            .overlay(
        //                RoundedRectangle(cornerRadius: 50)
        //                    .stroke(lineWidth: 10.0)
        //                    .foregroundColor(Color.white)
        //            )
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        TestLocationSelector()
    }
}
