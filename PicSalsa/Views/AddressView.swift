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
    @State var showReviewView = false
   
    
 var body: some View {
       
            Form {
                Section {
                    TextField("Name", text: $order.name)
                        .keyboardType(.default)
                        .autocapitalization(.words)
                    
                    iPhoneNumberField("", text: $order.tel)
                        .foregroundColor(.lightGray)
                        .maximumDigits(10)
                        .clearButtonMode(.whileEditing)
                        .onClear { _ in isEditing.toggle() }
                        
                    TextField("Email", text: $order.email)
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                }
                
                Section {
                    Button("Would you like it delivered for $3?") {
                        order.delivery.toggle()
                        if order.delivery == true {
                            order.deliveryFee = 3
                        } else {
                            order.deliveryFee = 0
                        }
                    }
                    
                    if order.delivery == true {
                        Text("Only local delivery")
                        TextField("Street Address", text: $order.streetAddress)
                            .autocapitalization(.words)
                        TextField("City", text: $order.city)
                            .autocapitalization(.words)
                        TextField("State", text: $order.state)
                            .autocapitalization(.allCharacters)
                        TextField("Zip", text: $order.zip)
                            .keyboardType(.numberPad)
                    }
                    
                }
                
                Section(header: Text("Comments")) {
                    TextItem(text: $order.comment, placeholder: "Notes")
                        .autocapitalization(.words)
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


