//
//  TestLoadScreen.swift
//  Heard-v2
//
//  Created by Zachary Walsh on 3/14/22.
//

import SwiftUI

struct ContentViewNew: View {
    @State var displayLoading: Bool = true
    
     func turnOffLoading() {
         // Delay of 7.5 seconds
         DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
             displayLoading = false
         }
     }
    
    var body: some View{
        ZStack{
            if displayLoading == true {
                TestLoadScreen()
            }
            
            if displayLoading == false {
                TestCombinedView()
            }
        }
        .onAppear(){
            turnOffLoading()
        }
    }
}

struct TestLoadScreen: View {
    
    var logo: CGFloat {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return 900 * 0.5
        }else{
            return 900
        }
    }
    
    var offset: CGFloat {
                if UIDevice.current.userInterfaceIdiom == .phone {
                    return 140 * 0.5
                }else {
                    return 140
                }
        }
    
    
    var body: some View {
        VStack{
            Spacer()
            ZStack {
                Image("HeardLogo")
                    .resizable()
                    .frame(width: logo, height: logo)
                LoadingView()
                    .offset(y: offset)
            }
            Spacer()
        }
        .ignoresSafeArea()
    }
}

struct LoadingView: View {
    var body: some View {
        HStack(spacing: 20) {
            DotView()
            DotView(delay: 0.2)
            DotView(delay: 0.4)
        }
    }
}


struct DotView: View {
    @State var delay: Double = 0
    @State var scale: CGFloat = 0.5
    
    var frame: CGFloat {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return 60 * 0.5
        }else {
            return 60
        }
    }
    var body: some View {
        Circle()
            .frame(width: frame, height: frame)
            .foregroundColor(.FiletBlue)
            .scaleEffect(scale)
            .animation(Animation.easeInOut(duration: 0.6).repeatForever().delay(delay))
            .onAppear {
                withAnimation {
                    self.scale = 1
                }
            }
    }
}

struct TestLoadScreen_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewNew()
            .environmentObject(LineViewModel())
    }
}
