//
//  CustomTextField.swift
//  Affid
//
//  Created by David on 2022-11-19.
//

import SwiftUI

struct CustomTextField: View {
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
                            .frame(maxWidth: .infinity)
                            .frame(height: 55)
                            .clipShape(Capsule())
                    )
                    .padding()
            }
        }
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(
            placeHolderText: "Email",
            text: .constant("Hallå"))
    }
}
