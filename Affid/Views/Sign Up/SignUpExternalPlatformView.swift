//
//  SignUpExternalPlatformView.swift
//  Affid
//
//  Created by David on 2022-11-18.
//

import SwiftUI

struct SignUpExternalPlatformView: View {
    var body: some View {
        VStack(spacing: 20){
            ZStack {
                Button("Sign up with Google"){
                    print("Testing google button")
                }
                .font(.title3)
                .buttonStyle(GoogleButton())
                Image("googleLogo")
                    .offset(x: -130)
            }
            ZStack {
                Button("Sign Up with Apple"){
                    print("Testing Apple button")
                }
                .font(.title3)
                .buttonStyle(AppleButton())
                Image("appleLogo")
                    .offset(x: -130)
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
