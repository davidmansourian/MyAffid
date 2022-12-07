//
//  ResetPasswordContentView.swift
//  Affid
//
//  Created by David on 2022-12-07.
//

import SwiftUI

struct ResetPasswordContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State var resetEmail: String = ""
    var body: some View {
            LoginCloudsView()
            
            Spacer()
            Text("Reset Password")
                .font(.largeTitle)
                .foregroundColor(.white)
                .bold()
                .padding()
            Text("Enter the email associated with your account below")
                .foregroundColor(.gray)
                .padding()
                .font(.footnote)
            
            
            CustomTextField(placeHolderText: "Your Email", text: $resetEmail)
            
            
            Button(action: {
                viewModel.resetPassword(withEmail: resetEmail)
            }, label: {
                Text("Reset")
            })
            .buttonStyle(BlueButton())
            .padding()
    }
}
