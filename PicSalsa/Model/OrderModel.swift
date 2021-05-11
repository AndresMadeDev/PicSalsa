//
//  OrderModel.swift
//  PicSalsa
//
//  Created by Andres Made on 5/5/21.
//

import Firebase
import FirebaseFirestoreSwift


struct OrderModel: Identifiable, Codable {
    @DocumentID var id: String? = UUID().uuidString
    var name: String
    var tel: String
    var email: String
    var delivery: Bool
    var streetAddress: String
    var city: String
    var state: String
    var zip: String
    var total: Int
    var comment: String
    
    var original: Int
    var originalSpicy: Bool
    var mango: Int
    var mangoSpicy: Bool
    var pineapple: Int
    var pineappleSpicy: Bool
    var mangoPineapple: Int
    var mangoPineappleSpicy: Bool
    
    
    var dateAdded: Date
    var dateString: String{
        let formatter = DateFormatter()
    formatter.dateFormat = "EEEE, MMMM dd"
        return formatter.string(from: dateAdded)
    }
}
