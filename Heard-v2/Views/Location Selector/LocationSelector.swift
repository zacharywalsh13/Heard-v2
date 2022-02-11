//
//  LocationSelector.swift
//  Heard-v2
//
//  Created by Zachary Walsh on 1/17/22.
//

import SwiftUI
import Firebase

struct LocationSelector: View {
    
    @ObservedObject var LocationItems = LocationViewModel()
    
    var body: some View {
        VStack(spacing: 30){
            ForEach(LocationItems.L_B_Buttons) { item in
                Button(action: {
                    LocationItems.NavigationState = item.title.lowercased()
                    
                }, label: {
                    Text("\(item.title)")
                        .bold()
                        .LocationButton()
                })
            }
            
            Button(action: {
                LocationItems.updateData(BLupdate: BreadLineModel(id: "Tj6nbTrLlNvnQjKe0DJm", title: "update"))
            }, label: {
                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
            })
            NavigationLink(destination: MasterRequest2().navigationBarBackButtonHidden(false), tag: "breading", selection: $LocationItems.NavigationState) { EmptyView()
            }
            NavigationLink(destination: LocationSelector2().navigationBarBackButtonHidden(false), tag: "line", selection: $LocationItems.NavigationState) { EmptyView()
            }
        }
        
    }
    init() {
        LocationItems.getData()
    }

}

struct LocationSelector2: View {
    
    @StateObject var LocationItems = LocationViewModel()
    
    var body: some View {
        VStack(spacing: 30){
            ForEach(LocationItems.P_S_Buttons) { BreadLineModel in
                Button(action: {
                    LocationItems.NavigationState = BreadLineModel.title.lowercased()
                    
                }, label: {
                    Text("\(BreadLineModel.title)")
                        .bold()
                        .LocationButton()
                })
            }
            NavigationLink(destination: Line_Primary().navigationBarBackButtonHidden(false), tag: "primary", selection: $LocationItems.NavigationState) { EmptyView()
            }
            NavigationLink(destination: Line_Secondary().navigationBarBackButtonHidden(true), tag: "secondary", selection: $LocationItems.NavigationState) { EmptyView()
            }
            
        }
        
    }
    
}//
struct LocationSelector_Previews: PreviewProvider {
    static var previews: some View {
        LocationSelector()
    }
}
