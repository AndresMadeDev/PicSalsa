//
//  OrdersDetailView.swift
//  PicSalsa
//
//  Created by Andres Made on 5/6/21.
//

import SwiftUI

struct OrdersDetailView: View {
    
    var name: String = ""
    var tel: String = ""
    var email: String = ""
    var total: Int = 0
    var date: String = ""
    
    var delivery: Bool = false
    var street: String = ""
    var city: String = ""
    var state: String = ""
    var zip: String = ""
    var original: Int = 0
    var originalSpicy: Bool = false
    var mango: Int = 0
    var mangoSpicy: Bool = false
    var pineapple: Int = 0
    var pineappleSpicy: Bool = false
    var mangoPineapple: Int = 0
    var mangoPineappleSpicy: Bool = false
    var comment: String = ""
    
    var body: some View {
        Form {
            
            Section(header: Text("Customer Information")) {
                Text(name)
                Text(tel)
                if email.isEmpty{
                    
                }else{
                    Text(email)
                }
                Text("Ordered on \(date)")
                
            }
            
            Section(header: Text(delivery ? "Delivery" : "Curbside Pick Up")) {
            if delivery == true {
                    Text("Delivery address:")
                    Text(street)
                    Text(city)
                    HStack {
                        Text(state)
                            .padding(.trailing)
                        Text(zip)
                    }
                }
            }
            
            Section(header: Text("Order")) {
                if original == 0 {
                    
                } else {
                    HStack {
                        Text("Original")
                        Spacer()
                        Text("Qty: \(original)")
                        Spacer()
                        if originalSpicy{
                            Text("🌶")
                        }
                    }
                }
                if mango == 0 {
                    
                } else {
                    HStack {
                        Text("Mango")
                        Spacer()
                        Text("Qty: \(mango)")
                        Spacer()
                        if mangoSpicy{
                            Text("🌶")
                        }
                    }
                }
                if pineapple == 0 {
                    
                } else {
                    HStack {
                        Text("Pineapple")
                        Spacer()
                        Text("Qty: \(pineapple)")
                        Spacer()
                        if pineappleSpicy{
                            Text("🌶")
                        }
                    }
                }
                if mangoPineapple == 0 {
                    
                } else {
                    HStack {
                        Text("Original")
                        Spacer()
                        Text("Qty: \(mangoPineapple)")
                        Spacer()
                        if mangoPineappleSpicy{
                            Text("🌶")
                        }
                    }
                }
                
            }
            
            if comment.isEmpty {
            } else {
                    Text(comment)
            }
            
            Section {
                Text("Total Amount: $\(total)")
            }
        }.navigationTitle("Order Detail")
    }
}

struct OrdersDetailView_Previews: PreviewProvider {
    static var previews: some View {
        OrdersDetailView()
    }
}
