//
//  LoginViewMOdel.swift
//  Heard-v2
//
//  Created by Zachary Walsh on 1/13/22.
//

import Foundation

class loginViewModel: ObservableObject {
    
    @Published var loginText: String = ""
    @Published var NavigationState: String? = nil
    @Published var wrongLogin: Bool = false
    @Published var buttonNumbers: Array = [
        ["1","2","3"],
        ["4","5","6"],
        ["7","8","9"],
        ["0"]
    ]
    @Published var logins: Array = [
        "111501",
        "111111"
    ]
    
    
    func loginTextChange(number: String) {
        loginText = "\(loginText)\(number)"
    }
    
    
    func onlySix() {
        if loginText.count == 6{
            loginValidation()
        }
        if loginText.count == 7{
            loginText.removeLast()
            print("No 777")
            
        }
    }
    
    func loginValidation() {
        if logins.contains(loginText) {
            NavigationState = "location_selector"
            print("Right Login")
        }else{
            wrong_Login()
            print("Wrong Login")
        }
    }
    
    
    func wrong_Login() {
        wrongLogin.toggle()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.loginText = ""
            self.wrongLogin.toggle()
        }
    }
        
}

