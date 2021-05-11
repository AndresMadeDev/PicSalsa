//
//  AddressView.swift
//  PicSalsa
//
//  Created by Andres Made on 5/1/21.
//

import SwiftUI
import Firebase
import iPhoneNumberField




struct AddressView: View {
    
    @ObservedObject var order = Order()
    @State var isEditing: Bool = false
    @State var phoneEditing = false
    
    


    var body: some View {
        VStack {
            Form {
                Section {
                    TextField("Name", text: $order.name)
                        .keyboardType(.default)
                    
                    iPhoneNumberField("(000) 000-0000", text: $order.tel)
                        .flagHidden(false)
                        .flagSelectable(true)
                        .maximumDigits(10)
                        .clearButtonMode(.whileEditing)
                        .onClear { _ in isEditing.toggle() }
                        
                    TextField("Email", text: $order.email)
                        .keyboardType(.emailAddress)
                }
                
                Section {
                    Button("Would you like it delivered for $2?") {
                        order.delivery.toggle()
                        if order.delivery == true {
                            order.deliveryFee = 2
                        } else {
                            order.deliveryFee = 0
                        }
                    }
                    
                    if order.delivery == true {
                        Text("Only local delivery")
                        TextField("Street Address", text: $order.streetAddress)
                        TextField("City", text: $order.city)
                        TextField("State", text: $order.state)
                        TextField("Zip", text: $order.zip)
                    }
                    
                }
                
                Section(header: Text("Comments")) {
                    TextItem(text: $order.comment, placeholder: "Notes")
                        .frame(height: 100)
                }
                Section {
                    NavigationLink(destination: ReviewOrder(order: order)) {
                        Text("Review Order")
                    }
                    .disabled(order.hasValidName == false)
                }
            }.navigationTitle("Customer Information").navigationBarTitleDisplayMode(.inline)
        }
    }
}

//struct AddressView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddressView()
//    }
//}

