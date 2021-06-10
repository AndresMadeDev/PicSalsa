//
//  HomeView.swift
//  PicSalsa
//
//  Created by Andres Made on 5/5/21.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showSignInView = false
    @ObservedObject var viewModel = StoreViewModel()
    @State var openStore: Bool = true
    @Environment(\.route) private var route: Binding<Route>
    
    var body: some View {
       
            VStack {
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .onTapGesture(count: 4) {
                        showSignInView = true
                    }.fullScreenCover(isPresented: $showSignInView, content: {
                        SignInView()
                    })
                    .padding(.top, 50)
                
                
                ForEach(viewModel.storeModel) { item in
                    if item.open == true  {
//                        NavigationLink(
//                            destination: Menu(),
//                            label: {
//                                VStack{
//                                    Text("Enter")
//                                        .font(.title)
//                                        .padding()
//                                        .frame(width: 200, height: 60)
//                                        .background(Color(#colorLiteral(red: 0.9660997987, green: 0.2294508219, blue: 0.2233918607, alpha: 1)))
//                                        .foregroundColor(.white)
//                                        .clipShape(RoundedRectangle(cornerRadius: 20))
//                                        .padding(.top, 100)
//                                }
//                            })
                        
                        Button(action: {
                            route.wrappedValue = .onboarding
                        }, label: {
                            Text("Enter")
                                .font(.title)
                                .padding()
                                .frame(width: 200, height: 60)
                                .background(Color(#colorLiteral(red: 0.9660997987, green: 0.2294508219, blue: 0.2233918607, alpha: 1)))
                                .foregroundColor(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .padding(.top, 100)
                        })
                        
                    }else {
                        VStack(spacing: 20) {
                            
                            Text(item.introMessage)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(20)
                        }
                    }
                }
                HStack(spacing: 15) {
                    Text("Follow us on ")
                    HStack(spacing: 15){
                        Link(destination: URL(string: "https://m.facebook.com/rafysfamouspicsalsa/")!, label: {
                            Image("facebookLogo")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 30, height: 30)
                        })
                        
                        Link(destination: URL(string: "https://instagram.com/rafysfamospicsalsa?utm_medium=copy_link")!, label: {
                            Image("instagramLogo")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 20, height: 20)
                        })
                    }
                }.padding(.top, 50)
            }.navigationBarHidden(true)
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
