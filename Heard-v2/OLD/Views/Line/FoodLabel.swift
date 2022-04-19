//
//  FoodLabels.swift
//  Heard-v2
//
//  Created by Zachary Walsh on 1/17/22.
//

import SwiftUI

struct FoodLabelS: View {
    @EnvironmentObject var LineItems: LineViewModel
    let phoneModifier: CGFloat = 0.55
    var spacing: CGFloat {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return 30 * phoneModifier
        }else {
            return 30
        }
    }
    var body: some View{
        VStack(spacing: spacing){
            HStack(spacing: spacing){
                ForEach(LineItems.products1) { LineModel in
                    Button(action: {
                        switch LineModel.productTitle {
                        
                        case "Nuggets":
                            LineItems.NuggetPopup = true
                            LineItems.StripPopup = false
                            LineItems.GrilledFilletPopup = false
                            LineItems.GrilledNuggetPopup = false
                        case "Strips":
                            LineItems.NuggetPopup = false
                            LineItems.StripPopup = true
                            LineItems.GrilledFilletPopup = false
                            LineItems.GrilledNuggetPopup = false
                        case "Grilled Filets":
                            LineItems.NuggetPopup = false
                            LineItems.StripPopup = false
                            LineItems.GrilledFilletPopup = true
                            LineItems.GrilledNuggetPopup = false
                        case "Grilled Nuggets":
                            LineItems.NuggetPopup = false
                            LineItems.StripPopup = false
                            LineItems.GrilledFilletPopup = false
                            LineItems.GrilledNuggetPopup = true
                        default:
                            break
                        }
                        
                    }, label: {
                        Rectangle()
                            .frame(width: LineItems.RectangleWH, height: LineItems.RectangleWH, alignment: .center)
                            .foregroundColor(Color.reallyLightGrey)
                            .cornerRadius(50)
                            .overlay(
                                Image(LineModel.productImage)
                                    .resizable()
                                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                                    .frame(width: LineItems.ImageWH, height: LineItems.ImageWH, alignment: .center)
                                    .offset(x: LineModel.xOfset, y: LineModel.yOfset)
                            )
                            .overlay(
                                Text(LineModel.productTitle)
                                    .bold()
                                    .lineLimit(nil)
                                    .multilineTextAlignment(.leading)
                                    .padding()
                                    .font(.system(size: LineItems.foodTitleFSize))
                                    .foregroundColor(.black)
                                ,alignment: .bottom
                            )
                    })
                }
            }
            
            HStack(spacing: spacing){
                ForEach(LineItems.products2) { LineModel in
                    Button(action: {
                        switch LineModel.productTitle {
                        
                        case "Nuggets":
                            LineItems.NuggetPopup = true
                            LineItems.StripPopup = false
                            LineItems.GrilledFilletPopup = false
                            LineItems.GrilledNuggetPopup = false
                        case "Strips":
                            LineItems.NuggetPopup = false
                            LineItems.StripPopup = true
                            LineItems.GrilledFilletPopup = false
                            LineItems.GrilledNuggetPopup = false
                        case "Grilled Filets":
                            LineItems.NuggetPopup = false
                            LineItems.StripPopup = false
                            LineItems.GrilledFilletPopup = true
                            LineItems.GrilledNuggetPopup = false
                        case "Grilled Nuggets":
                            LineItems.NuggetPopup = false
                            LineItems.StripPopup = false
                            LineItems.GrilledFilletPopup = false
                            LineItems.GrilledNuggetPopup = true
                        default:
                            break
                        }
                    }, label: {
                        Rectangle()
                            .frame(width: LineItems.RectangleWH, height: LineItems.RectangleWH, alignment: .center)
                            .foregroundColor(Color.reallyLightGrey)
                            .cornerRadius(50)
                            .overlay(
                                Image(LineModel.productImage)
                                    .resizable()
                                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                                    .frame(width: LineItems.ImageWH, height: LineItems.ImageWH, alignment: .center)
                                    .offset(x: LineModel.xOfset, y: LineModel.yOfset)
                            )
                            .overlay(
                                Text(LineModel.productTitle)
                                    .bold()
//                                    .lineLimit(nil)
//                                    .multilineTextAlignment(.leading)
//                                    .lineSpacing(0.1)
                                    .padding()
                                    .font(.system(size: LineItems.foodTitleFSize))
                                    .minimumScaleFactor(0.01)
                                    .lineLimit(1)
                                    .foregroundColor(.black)
                                ,alignment: .bottom
                            )
                    })
                }
            }
            HStack(spacing: spacing){
                ForEach(LineItems.products3) { LineModel in
                    Button(action: {
                        switch LineModel.productTitle {
                        case "Filets":
                            LineItems.FilletPopup = true
                            LineItems.SpicyFilletPopup = false
                        case "Spicy Filets":
                            LineItems.FilletPopup = false
                            LineItems.SpicyFilletPopup = true
                        default:
                            break
                        }
                    }, label: {
                        Rectangle()
                            .frame(width: LineItems.RectangleWH, height: LineItems.RectangleWH, alignment: .center)
                            .foregroundColor(Color.reallyLightGrey)
                            .cornerRadius(50)
                            .overlay(
                                Image(LineModel.productImage)
                                    .resizable()
                                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                                    .frame(width: LineItems.PImageWH, height: LineItems.PImageWH, alignment: .center)
                                    .offset(x: LineModel.xOfset, y: LineModel.yOfset)
                            )
                            .overlay(
                                Text(LineModel.productTitle)
                                    .bold()
                                    .lineLimit(nil)
                                    .multilineTextAlignment(.leading)
                                    .padding()
                                    .font(.system(size: LineItems.foodTitleFSize))
                                    .foregroundColor(.black)
                                ,alignment: .bottom
                            )
                    })
                }
            }
        }
    }
}


struct FoodLabelP: View {
    @EnvironmentObject var LineItems: LineViewModel
    var body: some View{
        HStack(spacing: 30){
            ForEach(LineItems.products3) { LineModel in
                Button(action: {
                    switch LineModel.productTitle {
                    case "Filets":
                        LineItems.FilletPopup = true
                        LineItems.SpicyFilletPopup = false
                    case "Spicy Filets":
                        LineItems.FilletPopup = false
                        LineItems.SpicyFilletPopup = true
                    default:
                        break
                    }
                }, label: {
                    Rectangle()
                        .frame(width: LineItems.PRectangleWH, height: LineItems.PRectangleWH, alignment: .center)
                        .foregroundColor(Color.reallyLightGrey)
                        .cornerRadius(50)
                        .overlay(
                            Image(LineModel.productImage)
                                .resizable()
                                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                                .frame(width: LineItems.PImageWH, height: LineItems.PImageWH, alignment: .center)
                                .offset(x: LineModel.xOfset, y: LineModel.yOfset)
                        )
                        .overlay(
                            Text(LineModel.productTitle)
                                .bold()
                                .padding()
                                .font(.system(size: LineItems.PfoodTitleFSize))
                                .foregroundColor(.black)
                            ,alignment: .bottom
                        )
                })
            }
        }
    }
}
//struct FoodLabels_Previews: PreviewProvider {
//    static var previews: some View {
//        FoodLabels()
//    }
//}
