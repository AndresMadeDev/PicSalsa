//
//  IntroPageView.swift
//  PicSalsa
//
//  Created by Andres Made on 5/28/21.
//

import SwiftUI

struct IntroPageView: View {
    
    @ObservedObject var viewModel = StoreViewModel()
    @Environment(\.presentationMode) var mode
    @State private var showSignInView = false
    
    var body: some View {
        TabView {
            Image("image1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .tag(1)
            Image("image2")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .tag(2)
            HomeView()
                .tag(3)
        }
        .edgesIgnoringSafeArea(.all)
        .tabViewStyle(PageTabViewStyle())
        .navigationBarHidden(true)

    }
}

struct IntroPageView_Previews: PreviewProvider {
    static var previews: some View {
        IntroPageView()
    }
}
