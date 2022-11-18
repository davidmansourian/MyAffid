//
//  LoginFormView.swift
//  Affid
//
//  Created by David on 2022-11-18.
//

import SwiftUI

struct LoginFormView: View {
    @State var username: String = ""
    @State var password: String = ""
    var body: some View {
        VStack{
            TextField("Email Address", text: $username)
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
                .offset(y: 10)
        }
        .padding()
    }
}


struct LoginFormView_Previews: PreviewProvider {
    static var previews: some View {
        LoginFormView()
    }
}
