//
//  StoreModel.swift
//  PicSalsa
//
//  Created by Andres Made on 5/28/21.
//

import Firebase
import FirebaseFirestoreSwift


struct StoreModel: Identifiable, Codable{
    @DocumentID var id: String? = UUID().uuidString
    var open: Bool = true
    var introMessage: String
}
