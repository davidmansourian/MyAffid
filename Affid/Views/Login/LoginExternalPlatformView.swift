//
//  LoginExternalPlatformView.swift
//  Affid
//
//  Created by David on 2022-11-18.
//

import SwiftUI

struct LoginExternalPlatformView: View {
    var body: some View {
        VStack(spacing: 10){
            ZStack {
                Button("Continue with Google"){
                    print("Testing google button")
                }
                .font(.title3)
                .buttonStyle(GoogleButton())
                Image("googleLogo")
                    .offset(x: -130)
            }
            ZStack {
                Button("Continue With Apple"){
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

struct LoginExternalPlatformView_Previews: PreviewProvider {
    static var previews: some View {
        LoginExternalPlatformView()
    }
}
