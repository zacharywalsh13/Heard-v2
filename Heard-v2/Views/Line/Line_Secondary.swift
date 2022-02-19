//
//  Line.swift
//  Heard-v2
//
//  Created by Zachary Walsh on 1/17/22.
//

import SwiftUI

struct Line_Secondary: View {
    @EnvironmentObject var LineItems: LineViewModel
    var body: some View {
        ZStack{
            VStack {
                FoodLabelS()
            }
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
        }
    }
}

struct Line_Previews: PreviewProvider {
    static var previews: some View {
        Line_Secondary()
            .environmentObject(LineViewModel())
    }
}
