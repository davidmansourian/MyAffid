//
//  SignUpTextFieldView.swift
//  Affid
//
//  Created by David on 2022-12-07.
//

import SwiftUI

struct SignUpTextFieldView: View {
    @State var name: String = ""
    @State var email: String = ""
    @State var password: String = ""
    var body: some View {
        CustomTextField(placeHolderText: "Name", text: $name)
        CustomTextField(placeHolderText: "Email", text: $email)
        CustomTextField(placeHolderText: "Password", isSecureField: true, text: $password)
    }
}

struct SignUpTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpTextFieldView()
    }
}
