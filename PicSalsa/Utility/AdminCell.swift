//
//  AdminCell.swift
//  PicSalsa
//
//  Created by Andres Made on 5/20/21.
//

import SwiftUI

struct AdminCell: View {
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Name: ")
                Text("Tel: ")
                Text("email: ")
            }
        }
    }
}

struct AdminCell_Previews: PreviewProvider {
    static var previews: some View {
        AdminCell()
    }
}
