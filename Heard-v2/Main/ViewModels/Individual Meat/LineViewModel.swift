//
//  LineViewModel.swift
//  Heard-v2
//
//  Created by Zachary Walsh on 1/17/22.
//

import Foundation
import SwiftUI

class LineViewModel: ObservableObject {
    
    @Published var ShowRequestOptions: Bool = false
    
    @Published var FilletPopup: Bool = false
    @Published var SpicyFilletPopup: Bool = false
    @Published var NuggetPopup: Bool = false
    @Published var StripPopup: Bool = false
    @Published var GrilledNuggetPopup: Bool = false
    @Published var GrilledFilletPopup: Bool = false

    var foodTitleFSize: CGFloat {
            if UIDevice.current.userInterfaceIdiom == .phone {
                return 40 * 0.55
            } else {
                return 40
            }
        }
    var FSize: CGFloat {
            if UIDevice.current.userInterfaceIdiom == .phone {
                return 50 * 0.55
            } else {
                return 50
            }
        }
    var ImageWH: CGFloat {
            if UIDevice.current.userInterfaceIdiom == .phone {
                return 300 * 0.55
            } else {
                return 300
            }
        }
    var backgroundCircleWH: CGFloat {
            if UIDevice.current.userInterfaceIdiom == .phone {
                return 150 * 0.55
            } else {
                return 150
            }
        }
    var RectangleWH: CGFloat {
            if UIDevice.current.userInterfaceIdiom == .phone {
                return 275 * 0.55
            } else {
                return 275
            }
        }
    

    @Published var products1: [ItemLabel] = [
        ItemLabel(Rectanglewidth: 350, Rectangleheight: 350, backgroundCircleW: 200, backgroundCircleH: 200, ImageW: 450, ImageH: 450, FSize: 50, SSpacing: 0, foodTitleFSize: 45, SColor: Color.Cgreen, productImage: "Nuggets", productTitle: "Nuggets", xOfset: -3, yOfset: 15),
        ItemLabel(Rectanglewidth: 350, Rectangleheight: 350, backgroundCircleW: 200, backgroundCircleH: 200, ImageW: 400, ImageH: 400, FSize: 50, SSpacing: 0, foodTitleFSize: 45, SColor: Color.Cgreen, productImage: "Strips", productTitle: "Strips",xOfset: 17, yOfset: 0)
       ]
    
    @Published var products2: [ItemLabel] = [
        ItemLabel(Rectanglewidth: 350, Rectangleheight: 350, backgroundCircleW: 200, backgroundCircleH: 200, ImageW: 370, ImageH: 370, FSize: 50, SSpacing: 0, foodTitleFSize: 45, SColor: Color.Cgreen, productImage: "Grilled Nuggets", productTitle: "Grilled Nuggets",xOfset: 5, yOfset: -30),
        ItemLabel(Rectanglewidth: 350, Rectangleheight: 350, backgroundCircleW: 200, backgroundCircleH: 200, ImageW: 400, ImageH: 400, FSize: 50, SSpacing: 0, foodTitleFSize: 45, SColor: Color.Cgreen, productImage: "Grilled Fillets", productTitle: "Grilled Filets",xOfset: 0, yOfset: 0)
    ]
    
    @Published var products3: [ItemLabel] = [
        ItemLabel(Rectanglewidth: 350, Rectangleheight: 350, backgroundCircleW: 200, backgroundCircleH: 200, ImageW: 420, ImageH: 420, FSize: 50, SSpacing: 0, foodTitleFSize: 40, SColor: Color.Cgreen, productImage: "Fillets", productTitle: "Filets", xOfset: 0, yOfset: 0),
        ItemLabel(Rectanglewidth: 350, Rectangleheight: 350, backgroundCircleW: 200, backgroundCircleH: 200, ImageW: 400, ImageH: 400, FSize: 50, SSpacing: 0, foodTitleFSize: 40, SColor: Color.Cgreen, productImage: "Spicy", productTitle: "Spicy Filets", xOfset: 0, yOfset: 0)
    ]
    
    var PfoodTitleFSize: CGFloat {
            if UIDevice.current.userInterfaceIdiom == .phone {
                return 40 * 0.55
            } else {
                return 40
            }
        }
    var PFSize: CGFloat {
            if UIDevice.current.userInterfaceIdiom == .phone {
                return 50 * 0.55
            } else {
                return 50
            }
        }
    var PImageWH: CGFloat {
            if UIDevice.current.userInterfaceIdiom == .phone {
                return 250 * 0.55
            } else {
                return 250
            }
        }
    var PbackgroundCircleWH: CGFloat {
            if UIDevice.current.userInterfaceIdiom == .phone {
                return 150 * 0.55
            } else {
                return 150
            }
        }
    var PRectangleWH: CGFloat {
            if UIDevice.current.userInterfaceIdiom == .phone {
                return 300 * 0.55
            } else {
                return 300
            }
        }
    
    }
    

