//
//  Line_Primary.swift
//  Heard-v2
//
//  Created by Zachary Walsh on 1/18/22.
//

import SwiftUI

struct Line_Primary: View {
    @EnvironmentObject var LineItems: LineViewModel
    var body: some View {
        ZStack {
            VStack {
                FoodLabelP()
            }
            if LineItems.FilletPopup == true {
               FilletPopup()
            }
            if LineItems.SpicyFilletPopup == true {
                SpicyFilletPopup()
            }
        }
    }
}



struct LineP_Previews: PreviewProvider {
    static var previews: some View {
        Line_Primary()
            .environmentObject(LineViewModel())
    }
}
