//
//  ContentView.swift
//  Heard-v2
//
//  Created by Zachary Walsh on 1/12/22.
//

import SwiftUI




struct LoginView: View {
    
    @StateObject var LoginItems: loginViewModel
    
    var Spacing: CGFloat {
            if UIDevice.current.userInterfaceIdiom == .phone {
                return 10
            } else {
                return 15
            }
        }
    var VSpacing: CGFloat {
            if UIDevice.current.userInterfaceIdiom == .phone {
                return 15
            } else {
                return 15
            }
        }
    var fontS: CGFloat {
            if UIDevice.current.userInterfaceIdiom == .phone {
                return 80 * 0.7
            } else {
                return 80
            }
        }
    
    var body: some View {
        
        VStack{
            Spacer()
            Text("Welcome!")
                .bold()
                .welcome()
                .font(Font.custom("Apercu Pro Bold", size: fontS))

            
            Text("\(LoginItems.loginText)")
                .bold()
                .foregroundColor(LoginItems.wrongLogin ? Color.red : Color.FontBlue)
                .modifier(loginTextModifier(LoginItems: loginViewModel()))
            VStack(spacing: VSpacing){
                ForEach(LoginItems.buttonNumbers, id: \.self) { row in
                    HStack(spacing: Spacing) {
                        ForEach(row, id: \.self) { number in
                            Button(action: {
                                LoginItems.loginTextChange(number: number)
                                LoginItems.onlySix()
                            }, label: { 
                                Text(number)
                                    .loginButton()
                            })
                        }
                    }
                }
            }
//            NavigationLink(destination:
//
////                            LocationSelector().navigationBarBackButtonHidden(true), tag: "location_selector", selection: $LoginItems.NavigationState) { EmptyView()
//
////                testLineView().navigationBarBackButtonHidden(true), tag: "location_selector", selection: $LoginItems.NavigationState) { EmptyView()
////            }
            Spacer()
        }
    }
}
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(LoginItems: loginViewModel())
    }
}
