//
//  LoginViewModifiers.swift
//  Heard-v2
//
//  Created by Zachary Walsh on 1/15/22.
//

import SwiftUI

struct WelcomeModifiers: ViewModifier{
    var fontS: CGFloat {
            if UIDevice.current.userInterfaceIdiom == .phone {
                return 80 * 0.7
            } else {
                return 80
            }
        }
    func body(content: Content) -> some View {
        content
            .font(.system(size: fontS))
            .foregroundColor(Color.FontBlue)    }
}

struct loginTextModifier: ViewModifier{
    var Width: CGFloat {
            if UIDevice.current.userInterfaceIdiom == .phone {
                return 460 * 0.7
            } else {
                return 460
            }
        }
    var Hieght: CGFloat {
            if UIDevice.current.userInterfaceIdiom == .phone {
                return 100 * 0.7
            } else {
                return 100
            }
        }
    var Font: CGFloat {
            if UIDevice.current.userInterfaceIdiom == .phone {
                return 50 * 0.7
            } else {
                return 50
            }
        }
    
    var CRadius: CGFloat {
            if UIDevice.current.userInterfaceIdiom == .phone {
                return 20 * 0.7
            } else {
                return 20
            }
        }
    @StateObject var LoginItems: loginViewModel
    func body(content: Content) -> some View {
        content
            .frame(width: Width, height: Hieght, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(Color.reallyLightGrey)
            .cornerRadius(CRadius, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            .font(.system(size: Font))
            .font(.system(size: Font))
        }
    }

struct loginButtonsModifiers: ViewModifier{
    var Width: CGFloat {
            if UIDevice.current.userInterfaceIdiom == .phone {
                return 150 * 0.7
            } else {
                return 150
            }
        }
    var Height: CGFloat {
            if UIDevice.current.userInterfaceIdiom == .phone {
                return 100 * 0.7
            } else {
                return 100
            }
        }
    var Font: CGFloat {
            if UIDevice.current.userInterfaceIdiom == .phone {
                return 30 * 0.7
            } else {
                return 30
            }
        }
    var CRadius: CGFloat {
            if UIDevice.current.userInterfaceIdiom == .phone {
                return 80 * 0.7
            } else {
                return 80
            }
        }
    func body(content: Content) -> some View {
        content
            .frame(width: Width, height: Height, alignment: .center)
            .background(Color.lightGray)
            .foregroundColor(.FontBlue)
            .cornerRadius(CRadius)
            .font(.system(size: Font))
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
