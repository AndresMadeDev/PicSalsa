//
//  PicSalsaApp.swift
//  PicSalsa
//
//  Created by Andres Made on 5/1/21.
//

import SwiftUI
import Firebase

@main
struct PicSalsaApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(AuthViewModel.shared)
                
        }
    }
}
