//
//  OpenStoreView.swift
//  PicSalsa
//
//  Created by Andres Made on 5/28/21.
//

import SwiftUI

struct OpenStoreView: View {
    @ObservedObject var viewModel = StoreViewModel()
   
    
    var body: some View {
        ForEach(viewModel.storeModel){ item in
            if item.open == true {
                HomeView()
            } else {
                IntroPageView()
            }
        }
    }
}

struct OpenStoreView_Previews: PreviewProvider {
    static var previews: some View {
        OpenStoreView()
    }
}
