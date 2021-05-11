//
//  SignInView.swift
//  PicSalsa
//
//  Created by Andres Made on 5/5/21.
//

import SwiftUI

struct SignInView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    @Environment(\.presentationMode) var mode
    
    @State var email: String = ""
    @State var password: String = ""
    
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.03784824535, green: 0.1195619181, blue: 0.2646178603, alpha: 1))
            
            VStack(spacing: 50) {
                Spacer()
                
                Text("Admin Login")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                
                
                VStack(spacing: 20) {
                    CustomTexfield(text: $email, placeholder: Text("Email"), imageName: "envelope")
                    CustomSecureField(text: $password, placeholder: Text("Password"))
                }
                .padding().padding(.bottom, 25)
                
                Button(action: {
                    viewModel.login(withEmail: email, withPassword: password)
                    mode.wrappedValue.dismiss()
                }, label: {
                    Text("Sign In")
                        .font(.system(size: 25, weight: .bold))
                        .frame(width: 350, height: 50)
                        .foregroundColor(.white)
                        .background(Color(#colorLiteral(red: 0.9660997987, green: 0.2294508219, blue: 0.2233918607, alpha: 1)))
                        .cornerRadius(10)
                })
                Spacer()
                
                
                Image(systemName: "xmark.circle")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .opacity(0.5)
                    .padding()
                    .onTapGesture {
                        mode.wrappedValue.dismiss()
                    }
                
            }.padding(.bottom, 100)
        }.edgesIgnoringSafeArea(.all)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
