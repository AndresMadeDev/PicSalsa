//
//  Order.swift
//  PicSalsa
//
//  Created by Andres Made on 5/1/21.
//

import Foundation

class Order: ObservableObject {

    @Published var original = 0
    @Published var originalSpicy = false
    @Published var originalPrice = 10
    
    @Published var mango = 0
    @Published var mangoSpicy = false
    @Published var mangoPrice = 12
    
    @Published var pineapple = 0
    @Published var pineappleSpicy = false
    @Published var pineapplePrice = 12
    
    @Published var mangoPineapple = 0
    @Published var mangoPineappleSpicy = false
    @Published var mangoPineapplePrice = 12
    
    @Published var comment = ""
    
    @Published var name = ""
    @Published var streetAddress = ""
    @Published var city = ""
    @Published var state = ""
    @Published var zip = ""
    @Published var tel = "Tel: "
    @Published var email = ""
    
    @Published var delivery = false
    @Published var deliveryFee = 0
    
    @Published var introMessage = ""
    @Published var openStore = false
    
    @Published var selection:Int? = nil
    
    var deliveryTotalFee: Bool {
        if delivery == true {
            deliveryFee = 3
        }
        return delivery
    }
    
    var hasValidOrder: Bool {
        if original == 0 && mango == 0 && pineapple == 0 && mangoPineapple == 0 {
            return false
        }
        return true
    }
    
    var hasValidName: Bool {
        if name.isEmpty || tel.isEmpty {
            return false
        }
        return true
    }
}



