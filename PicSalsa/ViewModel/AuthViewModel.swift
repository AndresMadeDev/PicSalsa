//
//  AuthViewModel.swift
//  PicSalsa
//
//  Created by Andres Made on 5/5/21.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    static let shared = AuthViewModel()
    @Published var orderModel = [OrderModel]()
    private var db = Firestore.firestore()
    
    init(){
        userSession = Auth.auth().currentUser

    }
    
    func login(withEmail email: String, withPassword password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error{
                print("DEBUG: Login Failed\(error.localizedDescription)")
                return
            }
            guard let user = result?.user else { return }
            self.userSession = user
            print("Sucsess Logged in.......")
            
        }
    }
    
    func fetchOrders() {
        db.collection("order")
            .order(by: "dateAdded", descending: false)
            .addSnapshotListener { (QuerySnapshot, error) in
                guard let documents = QuerySnapshot?.documents else {
                    print("No Documents........")
                    return
                }
                self.orderModel = documents.compactMap{(QueryDocumentSnapshot) -> OrderModel? in
                    return try? QueryDocumentSnapshot.data(as: OrderModel.self)
                    
                }
            }
    }
    
    func delete(at IndexSet: IndexSet) {
        IndexSet.forEach { index in
            let order = orderModel[index]
            db.collection("order")
                .document(order.id!)
                .delete{ error in
                    if let error = error {
                        print(error.localizedDescription)
                    } else {
                        self.fetchOrders()
                    }
                    
                }
        }
    }

    func signOut(){
        self.userSession = nil
        try? Auth.auth().signOut()
        
        
    }
    
}
