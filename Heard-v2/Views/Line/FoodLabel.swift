//
//  FoodLabels.swift
//  Heard-v2
//
//  Created by Zachary Walsh on 1/17/22.
//

import SwiftUI

struct FoodLabelS: View {
    @EnvironmentObject var LineItems: LineViewModel

    var body: some View{
        VStack(spacing: 30){
            HStack(spacing: 30){
                ForEach(LineItems.products1) { LineModel in
                    Button(action: {
                        switch LineModel.productTitle {
                        
                        case "Nuggets":
                            LineItems.NuggetPopup.toggle()
                            print("n works")
                            print(LineItems.NuggetPopup)
                        case "Strips":
                            LineItems.StripPopup.toggle()
                            print("s works")
                            print(LineItems.StripPopup)
                        case "Grilled Filets":
                            LineItems.GrilledFilletPopup.toggle()
                            print("gf works")
                        case "Grilled Nuggets":
                            LineItems.GrilledNuggetPopup.toggle()
                            print("Gn works")
                        default:
                            break
                        }
                        
                    }, label: {
                        Rectangle()
                            .frame(width: LineModel.Rectanglewidth, height: LineModel.Rectangleheight, alignment: .center)
                            .foregroundColor(Color.reallyLightGrey)
                            .cornerRadius(50)
                            .overlay(
                                Image(LineModel.productImage)
                                    .resizable()
                                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                                    .frame(width: LineModel.ImageW, height: LineModel.ImageH, alignment: .center)
                                    .offset(x: LineModel.xOfset, y: LineModel.yOfset)
                            )
                            .overlay(
                                Text(LineModel.productTitle)
                                    .bold()
                                    .padding()
                                    .font(.system(size: LineModel.foodTitleFSize))
                                    .foregroundColor(.FontBlue)
                                ,alignment: .bottom
                            )
                    })
                }
            }
            
            HStack(spacing: 30){
                ForEach(LineItems.products2) { LineModel in
                    Button(action: {
                        switch LineModel.productTitle {
                        
                        case "Nuggets":
                            LineItems.NuggetPopup.toggle()
                        case "Strips":
                            LineItems.StripPopup.toggle()
                        case "Grilled Filets":
                            LineItems.GrilledFilletPopup.toggle()
                            print("gf works")
                            print(LineItems.GrilledFilletPopup)
                        case "Grilled Nuggets":
                            LineItems.GrilledNuggetPopup.toggle()
                            print("Gn works")
                            print(LineItems.GrilledNuggetPopup)
                        default:
                            break
                        }
                    }, label: {
                        Rectangle()
                            .frame(width: LineModel.Rectanglewidth, height: LineModel.Rectangleheight, alignment: .center)
                            .foregroundColor(Color.reallyLightGrey)
                            .cornerRadius(50)
                            .overlay(
                                Image(LineModel.productImage)
                                    .resizable()
                                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                                    .frame(width: LineModel.ImageW, height: LineModel.ImageH, alignment: .center)
                                    .offset(x: LineModel.xOfset, y: LineModel.yOfset)
                            )
                            .overlay(
                                Text(LineModel.productTitle)
                                    .bold()
                                    .padding()
                                    .font(.system(size: LineModel.foodTitleFSize))
                                    .foregroundColor(.FontBlue)
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
        VStack(spacing: 30){
            ForEach(LineItems.products3) { LineModel in
                Button(action: {
                    switch LineModel.productTitle {
                    case "Filets":
                        LineItems.FilletPopup.toggle()
                    case "Spicy Filets":
                        LineItems.SpicyFilletPopup.toggle()
                    default:
                        break
                    }
                }, label: {
                    Rectangle()
                        .frame(width: LineModel.Rectanglewidth, height: LineModel.Rectangleheight, alignment: .center)
                        .foregroundColor(Color.reallyLightGrey)
                        .cornerRadius(50)
                        .overlay(
                            Image(LineModel.productImage)
                                .resizable()
                                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                                .frame(width: LineModel.ImageW, height: LineModel.ImageH, alignment: .center)
                                .offset(x: LineModel.xOfset, y: LineModel.yOfset)
                        )
                        .overlay(
                            Text(LineModel.productTitle)
                                .bold()
                                .padding()
                                .font(.system(size: LineModel.foodTitleFSize))
                                .foregroundColor(.FontBlue)
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
