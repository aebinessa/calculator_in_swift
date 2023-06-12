//
//  totalText.swift
//  my_first_swift
//
//  Created by Abdullah Bin Essa on 6/5/23.
//

import SwiftUI

struct totalText: View {
    var value: String = "0"
    var body: some View {
        Text(value)
            .font(.system(size: 70))
            .fontWeight(.light)
            .padding()
            .foregroundColor(.white)
            .lineLimit(1)
    }
}

struct totalText_Previews: PreviewProvider {
    static var previews: some View {
        totalText()
            . background(.black)
    }
}
