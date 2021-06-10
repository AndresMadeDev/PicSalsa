//
//  ContentView.swift
//  PicSalsa
//
//  Created by Andres Made on 5/1/21.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    @AppStorage("route") var route = Route.onboarding
    
    var body: some View {
        Group {
            if viewModel.userSession == nil {
//                HomeView()
                
                switch route {
                case .onboarding:
                    Menu().environment(\.route, $route)
                case .home:
                    HomeView().environment(\.route, $route)
                }
                
            } else {
                AdminTabView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
