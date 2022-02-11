//
//  Heard_v2App.swift
//  Heard-v2
//
//  Created by Zachary Walsh on 1/12/22.
//

import SwiftUI
import Firebase

@main

struct Heard_v2App: App {
    @StateObject var LineItems = LineViewModel()
    @StateObject var FilletDataEO = FilletDataVM()
    @StateObject var SpicyFilletDataEO = SpicyFilletDataVM()
    @StateObject var NuggetDataEO = NuggetDataVM()
    @StateObject var StripDataEO = StripDataVM()
    @StateObject var GrilledNuggetDataEO = GrilledNuggetDataVM()
    @StateObject var GrilledFilletDataEO = GrilledFilletDataVM()


    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                LoginView(LoginItems: loginViewModel())
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(LineItems)
            .environmentObject(FilletDataEO)
            .environmentObject(SpicyFilletDataEO)
            .environmentObject(NuggetDataEO)
            .environmentObject(StripDataEO)
            .environmentObject(GrilledNuggetDataEO)
            .environmentObject(GrilledFilletDataEO)
        }
    }
}
