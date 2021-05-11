//
//  TextItem.swift
//  PicSalsa
//
//  Created by Andres Made on 5/1/21.
//

import SwiftUI

struct TextItem: View {
    
    @Binding var text: String
    let placeholder: String
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(Color(UIColor.placeholderText))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 12)
            }
            TextEditor(text: $text)
                .padding(4)
        }
    }
}
