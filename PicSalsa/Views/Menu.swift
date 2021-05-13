//
//  Menu.swift
//  PicSalsa
//
//  Created by Andres Made on 5/1/21.
//

import SwiftUI

struct Menu: View {
    
    @ObservedObject var order = Order()
    @State var isActive : Bool = false

    var body: some View {
       
            Form{
                Section(header: Text("🍅 Original $10")){
                    Stepper(value: $order.original.animation(), in: 0...10) {
                        Text("Quatity: \(order.original)")
                    }
                    if order.original == 0 {
                        
                    } else {
                        Toggle(isOn: $order.originalSpicy) {
                            Text("Would you like it spicy 🌶?")
                        }
                        Text("$\(order.original * order.originalPrice)")
                    }
                }
                
                Section(header: Text("🥭 Mango $12")){
                    Stepper(value: $order.mango.animation(), in: 0...10) {
                        Text("Quatity: \(order.mango)")
                    }
                    if order.mango == 0 {
                        
                    } else {
                        Toggle(isOn: $order.mangoSpicy) {
                            Text("Would you like it spicy 🌶?")
                        }
                        Text("$\(order.mango * order.mangoPrice)")
                    }
                }
                
                Section(header: Text("🍍 Pineapple $12")){
                    Stepper(value: $order.pineapple.animation(), in: 0...10) {
                        Text("Quatity: \(order.pineapple)")
                    }
                    if order.pineapple == 0 {
                        
                    } else {
                        Toggle(isOn: $order.pineappleSpicy) {
                            Text("Would you like it spicy 🌶?")
                        }
                        Text("$\(order.pineapple * order.pineapplePrice)")
                    }
                }
                
                Section(header: Text("🥭🍍 Mango Pineapple 12")){
                    Stepper(value: $order.mangoPineapple.animation(), in: 0...10) {
                        Text("Quatity: \(order.mangoPineapple)")
                    }
                    if order.mangoPineapple == 0 {
                        
                    } else {
                        Toggle(isOn: $order.mangoPineappleSpicy) {
                            Text("Would you like it spicy 🌶?")
                        }
                        Text("$\(order.mangoPineapple * order.mangoPineapplePrice)")
                    }
                }
                
                Section {
                    NavigationLink(destination: AddressView(order: order, rootIsActive: self.$isActive),  isActive: self.$isActive) {
                        Text("Next")
                    }
                    .isDetailLink(false)
                    .disabled(order.hasValidOrder == false)
                    
                }
                
            }
            
            .navigationBarTitle("Place your Order")
            }
        
    }


struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
