//
//  HomeView.swift
//  PicSalsa
//
//  Created by Andres Made on 5/5/21.
//

import SwiftUI

struct HomeView: View {
    
    @State var showSignInView = false
    @ObservedObject var viewModel = AuthViewModel()
    @Environment(\.presentationMode) var mode
    
    var body: some View {
        NavigationView {
        VStack {
                    Image("logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                        .onTapGesture(count: 4) {
                            showSignInView = true
                        }.fullScreenCover(isPresented: $showSignInView, content: {
                            SignInView()
                        })
            
            NavigationLink(
                destination: Menu(),
                label: {
                    Text("Enter")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .padding()
                        .frame(width: 200, height: 60)
                        .background(Color(#colorLiteral(red: 0.9660997987, green: 0.2294508219, blue: 0.2233918607, alpha: 1)))
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        
                }).padding()    
            Spacer()
            
            }
        .background(Color.white)
            .navigationBarHidden(true)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
