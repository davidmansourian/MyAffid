//
//  CustomTextField.swift
//  Affid
//
//  Created by David on 2022-11-19.
//

import SwiftUI

// customTextField and secureTextfield implementation taken from video:
// https://www.youtube.com/watch?v=3pIXMwvJLZs

struct CustomTextField: View {
    let placeHolderText: String
    var isSecureField: Bool? = false
    @Binding var text: String
    var body: some View {
        VStack{
            HStack{
                if isSecureField ?? false{
                    SecureField(placeHolderText, text: $text)
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
                else{
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
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(
            placeHolderText: "Email",
            text: .constant("Hallå"))
    }
}

/*                TextField(placeHolderText, text: $text)
 .padding()
 .foregroundColor(.white)
 .background(
     Rectangle()
         .fill(ColorData.shared.textFieldColor.opacity(0.3))
         .frame(maxWidth: .infinity)
         .frame(height: 55)
         .clipShape(Capsule())
 )
 .padding()*/
