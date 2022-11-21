//
//  LoginExternalPlatformView.swift
//  Affid
//
//  Created by David on 2022-11-18.
//

import SwiftUI

struct LoginExternalPlatformView: View {
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
                Button {
                    print("Testing apple button")
                } label: {
                    Label {
                        Text("Continue With Apple")
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

struct LoginExternalPlatformView_Previews: PreviewProvider {
    static var previews: some View {
        LoginExternalPlatformView()
    }
}
