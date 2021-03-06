//
//  ReviewOrder.swift
//  PicSalsa
//
//  Created by Andres Made on 5/1/21.
//

import SwiftUI
import Firebase

struct ReviewOrder: View {
    @Environment(\.route) private var route: Binding<Route>
    @ObservedObject var order = Order()
    @State private var showingAlert = false
    var db = Firestore.firestore()

    var originalTotalPrice: Int{
       let originalTotalPrices =  order.original * order.originalPrice
        return originalTotalPrices
    }
    
    var mangoTotalPrice: Int{
       let mangoTotalPrices =  order.mango * order.mangoPrice
        return mangoTotalPrices
    }
    
    var pineappleTotalPrice: Int{
       let pineappleTotalPrices =  order.pineapple * order.pineapplePrice
        return pineappleTotalPrices
    }
    var magoPineappleTotalPrice: Int{
        let mangoPineappleTotalPrices =  order.mangoPineapple * order.mangoPineapplePrice
        return mangoPineappleTotalPrices
    }
    
    var total: Int {
        let totalSale = originalTotalPrice +
            mangoTotalPrice +
            pineappleTotalPrice +
            magoPineappleTotalPrice + order.deliveryFee
        
        return totalSale
    }
    
    var body: some View {
        
        Form {
            Section{
                Text(order.name)
                Text(order.tel)
                if order.email.isEmpty{
                    
                }else{
                    Text(order.email)
                        .font(.title3)
                }
            }

            Section{
                if order.delivery == false {
                    Text("Curbside Pick Up")
                } else {
                    Text("Delivery address:")
                    Text(order.streetAddress)
                    Text(order.city)
                    HStack {
                        Text(order.state)
                            .padding(.trailing)
                        Text(order.zip)
                    }
                    
                    Text("Delivery fee: $\(order.deliveryFee)")
                }
            }
            
            Section{
                
                if order.original == 0{
                    
                } else {
                    HStack(alignment: .center) {
                        Text("Original    ")
                        Spacer()
                        Text("Qty: \(order.original)")
                        Spacer()
                        Text("$\(originalTotalPrice)")
                        Spacer()
                        if order.originalSpicy{
                            Text("????")
                        }
                        
                    }
                    
                }
                
                if order.mango == 0{
                    
                } else {
                    HStack(alignment: .center) {
                        Text("Mango     ")
                        Spacer()
                        Text("Qty: \(order.mango)")
                        Spacer()
                        Text("$\(mangoTotalPrice)")
                        Spacer()
                        if order.mangoSpicy{
                            Text("????")
                        }
                    }
                }
                
                
                if order.pineapple == 0{
                    
                } else {
                    HStack(alignment: .center) {
                        Text("Pineapple")
                        Spacer()
                        Text("Qty: \(order.pineapple)")
                        Spacer()
                        Text("$\(pineappleTotalPrice)")
                        Spacer()
                        
                        if order.pineappleSpicy{
                            Text("????")
                        }
                    }
                }
                
                if order.mangoPineapple == 0{
                    
                } else {
                    HStack(alignment: .center) {
                        Text("Mango \nPineapple")
                        Spacer()
                        Text("Qty: \(order.mangoPineapple)")
                        Spacer()
                        Text("$\(magoPineappleTotalPrice)")
                        Spacer()
                        if order.mangoPineappleSpicy{
                            Text("????")
                        }
                    }
                }
            }
            
            if order.comment.isEmpty{
                
            }else {
                Text("\(order.comment)")
            }
            
            Section{
                Text("Total: $\(total)")
            }
            
            Section{
                Button("Place Order"){
                    upLoad()
                    showingAlert.toggle()
                }
                .disabled(order.hasValidName == false)
                .sheet(isPresented: $showingAlert, onDismiss: dissmiss, content: {
                    VStack {
                        Text("Thank you for your order.")
                        Text("We will text you to comfirm your order.")
                    }
                })
            }
        }.navigationTitle("Review and Place Order")
    }
    func dissmiss(){
        route.wrappedValue = .home
    }
    
    func upLoad(){
        db.collection("order").addDocument(data: [
            "name": order.name,
            "tel": order.tel,
            "email": order.email,
            "streetAddress": order.streetAddress,
            "city": order.city,
            "state": order.state,
            "zip": order.zip,
            
            "comment": order.comment,
            
            "delivery": order.delivery,
            "deliverfee": order.deliveryFee,
            
            "original": order.original,
            "originalSpicy": order.originalSpicy,
            "originalPrice": order.originalPrice,
            
            "mango": order.mango,
            "mangoSpicy": order.mangoSpicy,
            "mangoPrice": order.mangoPrice,
            
            "mangoPineapple": order.mangoPineapple,
            "mangoPineappleSpicy": order.mangoPineappleSpicy,
            "mangoPineapplePrice": order.mangoPineapplePrice,
            
            "pineapple": order.pineapple,
            "pineappleSpicy": order.pineappleSpicy,
            "pineapplePrice": order.pineapplePrice,
            
            "total": total,
            
          "dateAdded": Timestamp(date: Date()),

        ])
        order.name = ""
        order.tel = ""
        order.email = ""
        order.streetAddress = ""
        order.city = ""
        order.zip = ""
        order.original = 0
        order.mango = 0
        order.pineapple = 0
        order.mangoPineapple = 0
        order.comment = ""
        order.delivery = false
    }
}


