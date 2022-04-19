////
////  AmountSelectorPopupTemplate.swift
////  Heard-v2
////
////  Created by Zachary Walsh on 4/12/22.
////
//
//import SwiftUI
//
//struct AmountSelectorPopupTemplate: View {
//    func totalSeconds() -> Int {
//        let components = Calendar.current.dateComponents([.hour, .second, .minute], from: Date())
//
//        let currentHour = components.hour ?? 0
//        let currentMinute = components.minute ?? 0
//        let currentSecond = components.second ?? 0
//        
//        let totalSeconds = (currentSecond) + (currentMinute * 60) + (currentHour * 3600)
//        
//        return Int(totalSeconds)
//    }
//    
//    var closePopup: () -> Void
//
//    
//    var body: some View {
//        VStack(spacing: 20){
//            HStack {
//                ClosePopup(closeFunction: ClosePopup())
//                    .padding(.leading, 50)
//                Spacer()
//            }
//            
//        }
//        .frame(width: 600, height: 950, alignment: .center)
//        .background(Color.white)
//        .cornerRadius(40)
//        .shadow(radius: 3)
//    }
//}
//
//struct AmountSelectorPopupTemplate_Previews: PreviewProvider {
//    static var previews: some View {
//        AmountSelectorPopupTemplate()
//    }
//}
