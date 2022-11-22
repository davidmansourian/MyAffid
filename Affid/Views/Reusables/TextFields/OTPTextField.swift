//
//  OTPTextField.swift
//  Affid
//
//  Created by David on 2022-11-19.
//

import SwiftUI

struct OTPTextField: View {
    let placeHolderText: String
    @Binding var text: String
    var isSelected = false
    var body: some View {
        VStack{
            HStack{
                TextField(placeHolderText, text: $text)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .background(
                        Capsule()
                            .fill(ColorData.shared.textFieldColor.opacity(0.3))
                            .frame(width: 55)
                            .frame(height: 55)
                            .overlay(Capsule().stroke(isSelected ? ColorData.shared.appSystemYellow : Color.clear, lineWidth: 4))
                    )
            }
        }
    }
}

struct OTPTextField_Previews: PreviewProvider {
    static var previews: some View {
        OTPTextField(placeHolderText: "Text", text: .constant("1"), isSelected: true)
    }
}
