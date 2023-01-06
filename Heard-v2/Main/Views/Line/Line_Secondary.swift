//
//  Line.swift
//  Heard-v2
//
//  Created by Zachary Walsh on 1/17/22.
//

import SwiftUI

struct Line_Secondary: View {
    @EnvironmentObject var LineItems: LineViewModel
    func close() {
        LineItems.ShowRequestOptions = false
    }
    var body: some View {
        VStack {
            ZStack{
                VStack{
                    HStack {
                        ClosePopup(closeFunction: close)
                        Spacer()
                    }
                    Spacer()
                }
                .frame(width: 700, height: 1000)
                FoodLabelS()
                
                if LineItems.NuggetPopup == true {
                    NuggetPopup()
                }
                if LineItems.StripPopup == true {
                    StripPopup()
                }
                if LineItems.GrilledNuggetPopup == true {
                    GrilledNuggetPopup()
                }
                if LineItems.GrilledFilletPopup == true {
                    GrilledFilletPopup()
                }
                if LineItems.FilletPopup == true {
                    FilletPopup()
                }
                if LineItems.SpicyFilletPopup == true {
                    SpicyFilletPopup()
                }
            }
            .frame(width: 820, height: 1120)
            .background(Color.white)
        }
    }
}

struct Line_Previews: PreviewProvider {
    static var previews: some View {
        Line_Secondary()
            .environmentObject(LineViewModel())
    }
}
