//
//  SignUpFormView.swift
//  Affid
//
//  Created by David on 2022-11-18.
//

import SwiftUI

struct SignUpFormView: View {
    @State var name: String = ""
    @State var email: String = ""
    @State var password: String = ""
    var body: some View {
        VStack{
            TextField("Name", text: $name)
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
                .offset(y: 10)
            TextField("Password", text: $password)
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
                .offset(y: 20)
        }
        .padding()
    }
}

struct SignUpFormView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpFormView()
    }
}
