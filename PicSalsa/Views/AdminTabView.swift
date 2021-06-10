//
//  AdminView2.swift
//  PicSalsa
//
//  Created by Andres Made on 5/20/21.
//

import SwiftUI

struct AdminTabView: View {
    var body: some View {
        TabView{
            AdminView()
                .tabItem {
                    Label("Intro", systemImage: "lock.circle")
                }
            IntroView()
                .tabItem {
                    Label("Intro", systemImage: "lock.circle")
                }
        }
    }
}

struct AdminTabView_Previews: PreviewProvider {
    static var previews: some View {
        AdminTabView()
    }
}


