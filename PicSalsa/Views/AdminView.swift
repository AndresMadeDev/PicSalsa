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
                            OrderViewCell(name: item.name,
                                          tel: item.tel,
                                          total: item.total,
                                      dateAdded: item.dateString)
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
                            .onTapGesture {
                                AuthViewModel.shared.signOut()
                            }.fullScreenCover(isPresented: $exit, content: {
                                HomeView()
                            })
                                               
                    }.padding(.trailing)
                }
            }
        }
    }
    func deleteitem(at offset: IndexSet){
       print("Delete")
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
