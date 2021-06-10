//
//  IntroView.swift
//  PicSalsa
//
//  Created by Andres Made on 5/28/21.
//

import SwiftUI
import Firebase

struct IntroView: View {
    @State var intorText: String = ""
    @ObservedObject var order = Order()
    var db = Firestore.firestore()

    
    var body: some View {
        VStack {
            
           
            Toggle("Open Store", isOn: $order.openStore)
                .font(.largeTitle)
                .padding(.top)
                .accentColor(.red)
            
            Spacer()
            
            if order.openStore == true {
                Text("Store is open")
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(.green)
            } else {
                VStack(spacing: 50) {
                    Text("Store is close")
                        .bold()
                        .font(.largeTitle)
                        .foregroundColor(.red)
                    VStack {
                        HStack {
                            Text("Enter Intro Message")
                            Spacer()
                        }
                        TextEditor(text: $order.introMessage)
                            .frame(height: 100)
                            .overlay(RoundedRectangle(cornerRadius: 6).stroke(Color.secondary, lineWidth: 1))
                    }
                    
                }
            }
            
            Spacer()
            
            Button(action: {
                openStoreMessage()
            }, label: {
                Text("Submit")
                    .fontWeight(.bold)
                    .frame(width: 280, height: 44)
                    .foregroundColor(.white)
                    .background(Color.red)
                    .cornerRadius(8)
            })
            .padding(.bottom, 75)
        }
        .padding()
    }
    func openStoreMessage(){
        db.collection("openStore")
            .document("rYgOacLKgE5AmjVT1gsD")
            .updateData([
                "introMessage" : order.introMessage,
                "open" : order.openStore
            ]) { error in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    print("Store Updated")
                }
            }
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}
