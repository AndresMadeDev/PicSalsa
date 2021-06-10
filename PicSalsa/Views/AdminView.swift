//
//  AdminView.swift
//  PicSalsa
//
//  Created by Andres Made on 5/5/21.
//

import SwiftUI
import Firebase

struct AdminView: View {
    
    @ObservedObject var viewModel = AuthViewModel()
    @Environment(\.presentationMode) var mode
    private var db = Firestore.firestore()
    @State var exit: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                List{
                    ForEach(viewModel.orderModel) { item in
                       NavigationLink(
                        destination: OrdersDetailView(
                            name: item.name,
                            tel: item.tel,
                            email: item.email,
                            total: item.total,
                            date: item.dateString,
                            delivery: item.delivery,
                            street: item.streetAddress,
                            city: item.city,
                            state: item.state,
                            zip: item.zip,
                            original: item.original,
                            originalSpicy: item.originalSpicy,
                            mango: item.mango,
                            mangoSpicy: item.mangoSpicy,
                            pineapple: item.pineapple,
                            pineappleSpicy: item.pineappleSpicy,
                            mangoPineapple: item.mangoPineapple,
                            mangoPineappleSpicy: item.mangoPineappleSpicy,
                            comment: item.comment
                            ),
                        label: {
                                VStack(alignment: .leading, spacing: 20){
                                    VStack(alignment: .leading) {
                                        Text(item.name)
                                            .bold()
                                        Text(item.tel)
                                        Text(item.dateString)
                                        Text("Total: $\(item.total)")
                                        
                                        
                                    }
                                    Text("Order:")
                                        .bold()
                                    VStack{
                                        if item.original == 0 {
                                            
                                        } else {
                                            HStack {
                                                Text("Original")
                                                Spacer()
                                                Text("Qty: \(item.original)")
                                                Spacer()
                                                if item.originalSpicy{
                                                    Text("🌶")
                                                }
                                            }
                                        }
                                        if item.mango == 0 {
                                            
                                        } else {
                                            HStack {
                                                Text("Mango")
                                                Spacer()
                                                Text("Qty: \(item.mango)")
                                                Spacer()
                                                if item.mangoSpicy{
                                                    Text("🌶")
                                                }
                                            }
                                        }
                                        if item.pineapple == 0 {
                                            
                                        } else {
                                            HStack {
                                                Text("Pineapple")
                                                Spacer()
                                                Text("Qty: \(item.pineapple)")
                                                Spacer()
                                                if item.pineappleSpicy{
                                                    Text("🌶")
                                                }
                                            }
                                        }
                                        if item.mangoPineapple == 0 {
                                            
                                        } else {
                                            HStack {
                                                Text("Original")
                                                Spacer()
                                                Text("Qty: \(item.mangoPineapple)")
                                                Spacer()
                                                if item.mangoPineappleSpicy{
                                                    Text("🌶")
                                                }
                                            }
                                        }
                                    }
                                }.padding(.bottom)
                            
                        })
                    }.onDelete(perform: deleteitem)
                   
                }
                .navigationTitle("Orders")
                .listStyle(GroupedListStyle())
                .onAppear{
                    self.viewModel.fetchOrders()
                }
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()

                        SignOutButton()
                            .padding(.bottom)
                            .onTapGesture {
                                AuthViewModel.shared.signOut()
                            }.fullScreenCover(isPresented: $exit, content: {
                                HomeView()
                            })
                                               
                    }.padding(.trailing)
                }
            }.navigationBarItems(trailing: Text("Number of Order: \(viewModel.orderModel.count )"))
        }
    }
    func deleteitem(at offset: IndexSet){
        viewModel.delete(at: offset)
    }
}

struct AdminView_Previews: PreviewProvider {
    static var previews: some View {
        AdminView()
    }
}

struct SignOutButton: View {
    var body: some View{
        Text("Sign Out")
            .padding()
            .foregroundColor(.white)
            .background(Color(#colorLiteral(red: 0.9660997987, green: 0.2294508219, blue: 0.2233918607, alpha: 1)))
            .clipShape(Capsule())
    }
}
