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
    var body: some View {
        VStack{
            HStack{
                TextField(placeHolderText, text: $text)
                    .padding()
                    .foregroundColor(.white)
                    .background(
                        Rectangle()
                            .fill(ColorData.shared.textFieldColor.opacity(0.3))
                            .frame(width: 55)
                            .frame(height: 55)
                            .clipShape(Capsule())
                    )
                    .padding()
            }
        }
    }
}

struct OTPTextField_Previews: PreviewProvider {
    static var previews: some View {
        OTPTextField(placeHolderText: "Text", text: .constant("Hejsan"))
    }
}
