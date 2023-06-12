//
//  calculatorButton.swift
//  my_first_swift
//
//  Created by Abdullah Bin Essa on 6/5/23.
//

import SwiftUI

struct calculatorButton: View {
    var buttonText = "1"
    var buttonColor = Color(hue: 0.858, saturation: 0.028, brightness: 0.289)
    var buttonWidth: CGFloat = 70
    var action: (calculatorButton) -> Void = {_ in }
    var mode: calculatorMode = .notSet
    var body: some View {
        Button {
           action(self)
        } label: {
            Text(buttonText)
                .font(.largeTitle)
                .frame(width: buttonWidth,height: 70,alignment: .center)
                .background(buttonColor)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 50))
        }
    }

}

struct calculatorButton_Previews: PreviewProvider {
    static var previews: some View {
        calculatorButton()
    }
}
