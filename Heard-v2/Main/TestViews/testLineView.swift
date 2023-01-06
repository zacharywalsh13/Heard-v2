////
////  testLineView.swift
////  Heard-v2
////
////  Created by Zachary Walsh on 3/8/22.
////
//
//import SwiftUI
//class stateHandler: ObservableObject {
//    @Published var shouldPresent: Bool = false
//    @Published var nuggetPopup: Bool = false
//    @Published var StripPopup: Bool = false
//    @Published var gFilletPopup: Bool = false
//    @Published var gNuggetPopup: Bool = false
//    @Published var filletPopup: Bool = false
//    @Published var sFilletPopup: Bool = false
//}
//struct testLineView: View {
//    @EnvironmentObject var state: stateHandler
//    var body: some View {
//        ZStack {
//            VStack(spacing: 30){
//                HStack(spacing: 30){
//                    imgageButton(image: "nuggetsimg", title: "Nuggets", toggle:         state.nuggetPopup.toggle())
//                    imgageButton(image: "stripimg", title: "Strips", toggle:         state.StripPopup.toggle())
//                }
//                HStack(spacing: 30){
//                    imgageButton(image: "filletimg", title: "Fillets", toggle: state.filletPopup.toggle())
//                    imgageButton(image: "sfilletimg", title: "Spicy", toggle:  state.sFilletPopup.toggle())
//                }
//                HStack(spacing: 30){
//                    imgageButton(image: "gfilletimg", title: "Grilled Fillets", toggle: state.gFilletPopup.toggle())
//                    imgageButton2(image: "gnuggetimg", title: "Grilled Nuggets", toggle: state.gNuggetPopup.toggle())
//                }
//            }
//            if state.nuggetPopup == true {
//                NuggetPopup()
//            }
//        }
//        Spacer()
//    }
//}
//struct imgageButton: View{
//    var image: String
//    var title: String
//    var toggle: ()
//    var body: some View{
//        Button(action: {
//            toggle
//        }, label: {
//            imageReusable(Rectanglewidth: 275, Rectangleheight: 275, productImage: image, ImageW: 300, ImageH: 300, xOfset: 0, yOfset: 0, productTitle: title, foodTitleFSize: 30)
//            
//        })
//    }
//}
//
//struct imgageButton2: View{
//    var image: String
//    var title: String
//    var toggle: ()
//    var body: some View{
//        Button(action: {
//            toggle
//        }, label: {
//            imageReusable(Rectanglewidth: 275, Rectangleheight: 275,  : image, ImageW: 300, ImageH: 300, xOfset: 0, yOfset: -15, productTitle: title, foodTitleFSize: 30)
//            
//        })
//    }
//}
//
//struct testLineView_Previews: PreviewProvider {
//    static var previews: some View {
//        testLineView()
//    }
//}
