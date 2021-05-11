//
//  OrderViewCell.swift
//  PicSalsa
//
//  Created by Andres Made on 5/5/21.
//

import SwiftUI

struct OrderViewCell: View {
    
    var name: String
    var tel: String
    var total: Int
    var dateAdded: String
    
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 15) {
                VStack(alignment: .leading) {
                    Text(name)
                        .bold()
                        .font(.title3)
                    Text(tel)
                }
                
                
                HStack {
                    Text(dateAdded)
                        .font(.caption)
                    Spacer()
                    Text("Total: $\(total)")
                }
            }
            
           
            
            
        }
        .padding()
        .background(Color(#colorLiteral(red: 0.03784824535, green: 0.1195619181, blue: 0.2646178603, alpha: 1)))
        .foregroundColor(.white)
        .cornerRadius(15)
    }
}


