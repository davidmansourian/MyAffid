//
//  SignUpExternalPlatformView.swift
//  Affid
//
//  Created by David on 2022-11-18.
//

import SwiftUI

struct SignUpExternalPlatformView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        VStack(spacing: 20){
            ZStack {
                Button {
                    print("Testing google button")
                } label: {
                    Label {
                        Text("Sign Up With Google")
                    } icon: {
                        Image("googleLogo")
                            .padding(.leading, -38)
                    }
                }
                .font(.title3)
                .buttonStyle(GoogleButton())
            }
            
            ZStack {
                Button {
                   // viewModel.signInWithApple()
                } label: {
                    Label {
                        Text("Sign Up With Apple")
                    } icon: {
                        Image("appleLogo")
                            .padding(.leading, -38)
                    }
                }
                .font(.title3)
                .buttonStyle(AppleButton())
                
            }
        }
        .padding()
    }
    
}

struct SignUpExternalPlatformView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpExternalPlatformView()
    }
}
