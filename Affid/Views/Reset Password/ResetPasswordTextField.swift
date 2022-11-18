//
//  ResetPasswordTextField.swift
//  Affid
//
//  Created by David on 2022-11-18.
//

import SwiftUI

struct ResetPasswordTextField: View {
    @State var email: String = ""
    var body: some View {
        VStack{
            TextField("Email Address", text: $email)
                .foregroundColor(Color.white)
                .font(.headline)
                .padding()
                .background(
                    Rectangle()
                        .fill(ColorData.shared.textFieldColor)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .cornerRadius(38)
                )
        }
    }
}

struct ResetPasswordTextField_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordTextField()
    }
}
