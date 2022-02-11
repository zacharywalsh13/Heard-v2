//
//  ContentView.swift
//  Heard-v2
//
//  Created by Zachary Walsh on 1/12/22.
//

import SwiftUI




struct LoginView: View {
    
    @StateObject var LoginItems: loginViewModel

    var body: some View {
        
        VStack{
            Text("Welcome!")
                .bold()
                .welcome()
            
            Text("\(LoginItems.loginText)")
                .bold()
                .foregroundColor(LoginItems.wrongLogin ? Color.red : Color.FontBlue)
                .modifier(loginTextModifier(LoginItems: loginViewModel()))
            VStack(spacing: 15){
                ForEach(LoginItems.buttonNumbers, id: \.self) { row in
                    HStack(spacing: 15) {
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
            NavigationLink(destination: LocationSelector().navigationBarBackButtonHidden(true), tag: "location_selector", selection: $LoginItems.NavigationState) { EmptyView()
            }
        }
    }
}
//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView(LoginItems: loginViewModel())
//    }
//}
