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
            Spacer()
            ForEach(LocationItems.L_B_Buttons) { item in
                Button(action: {
                    LocationItems.NavigationState = item.title.lowercased()
                    
                }, label: {
                    Text("\(item.title)")
                        .bold()
                        .LocationButton()
                })
            }
            
            NavigationLink(destination: MasterRequest2().navigationBarBackButtonHidden(true), tag: "breading", selection: $LocationItems.NavigationState) { EmptyView()
            }
            NavigationLink(destination: LocationSelector2().navigationBarBackButtonHidden(true), tag: "line", selection: $LocationItems.NavigationState) { EmptyView()
            }
            
        }
        
    }
}

struct LocationSelector2: View {
    
    @StateObject var LocationItems = LocationViewModel()
    
    var body: some View {
        VStack(spacing: 30){
            Spacer()
            ForEach(LocationItems.P_S_Buttons) { BreadLineModel in
                Button(action: {
                    LocationItems.NavigationState = BreadLineModel.title.lowercased()
                    
                }, label: {
                    Text("\(BreadLineModel.title)")
                        .bold()
                        .LocationButton()
                })
                    .shadow(radius: 20)
            }
            NavigationLink(destination: Line_Primary().navigationBarBackButtonHidden(true), tag: "primary", selection: $LocationItems.NavigationState) { EmptyView()
            }
            NavigationLink(destination: Line_Secondary().navigationBarBackButtonHidden(true), tag: "secondary", selection: $LocationItems.NavigationState) { EmptyView()
            }
            
        }
        
    }
    
}
struct LocationSelector_Previews: PreviewProvider {
    static var previews: some View {
        LocationSelector()
    }
}
