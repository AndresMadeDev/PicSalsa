//
//  fetchStore.swift
//  PicSalsa
//
//  Created by Andres Made on 5/28/21.
//

import SwiftUI
import Firebase

class StoreViewModel: ObservableObject {
    
    private var db = Firestore.firestore()
    @Published var storeModel = [StoreModel]()
    
    init() {
        fetchStore()
    }
    
    func fetchStore(){
        db.collection("openStore")
            .addSnapshotListener { (QuerySnapshot, error) in
                guard let documents = QuerySnapshot?.documents else {
                    print("No Documents........")
                    return
                }
                self.storeModel = documents.compactMap{(QueryDocumentSnapshot) -> StoreModel? in
                    return try? QueryDocumentSnapshot.data(as: StoreModel.self)
                    
                }
            }

    }
    
}
