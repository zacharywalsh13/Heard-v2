//
//  LoginViewModifiers.swift
//  Heard-v2
//
//  Created by Zachary Walsh on 1/15/22.
//

import SwiftUI

struct WelcomeModifiers: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.system(size: 80))
            .padding()
            .foregroundColor(Color.FontBlue)    }
}

struct loginTextModifier: ViewModifier{
    @StateObject var LoginItems: loginViewModel
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(width: 460, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(Color.reallyLightGrey)
            .cornerRadius(20, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            .font(.system(size: 50))
            .font(.system(size: 50))
        }
    }

struct loginButtonsModifiers: ViewModifier{
    func body(content: Content) -> some View {
        content
            .frame(width: 150, height: 100, alignment: .center)
            .background(Color.lightGray)
            .foregroundColor(.FontBlue)
            .cornerRadius(80)
            .font(.system(size: 30))
    }
}



extension View {
    
    func welcome() -> some View {
        modifier(WelcomeModifiers())
    }
    
    func loginButton() -> some View {
        modifier(loginButtonsModifiers())
    }
}
