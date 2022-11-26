//
//  LoginExternalPlatformView.swift
//  Affid
//
//  Created by David on 2022-11-18.
//

import SwiftUI
import AuthenticationServices

struct LoginExternalPlatformView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        VStack(spacing: 20){
            ZStack {
                Button {
                    print("Testing google button")
                } label: {
                    Label {
                        Text("Continue With Google")
                    } icon: {
                        Image("googleLogo")
                            .padding(.leading, -38)
                    }
                }
                .font(.title3)
                .buttonStyle(GoogleButton())
            }
            
            ZStack {
                SignInWithAppleButton { request in
                    viewModel.signInWithApple(request)
                } onCompletion: { result in
                    viewModel.handleSignInWithAppleCompletion(result)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 60)
                .cornerRadius(38)
                
            }
        }
        .padding()
    }
}

struct LoginExternalPlatformView_Previews: PreviewProvider {
    static var previews: some View {
        LoginExternalPlatformView()
    }
}
