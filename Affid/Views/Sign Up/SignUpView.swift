//
//  SignUpView.swift
//  Affid
//
//  Created by David on 2022-11-18.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack{
            ColorData.shared.backGroundColor
                .edgesIgnoringSafeArea(.all)
            VStack{
                Spacer()
                
                LoginCloudsView()
                    .offset(y: 39)
                
                HStack{
                    Text("Create your account")
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                }
                
                SignUpExternalPlatformView()
                
                HStack{
                    Text("OR SIGN UP WITH EMAIL")
                        .foregroundColor(.gray)
                        .font(.footnote)
                }
                .padding()
                
                SignUpFormView()
                
                Spacer()
                
                SignUpPrivacyPolicyRow()
                    .padding()
                
                
                HStack {
                    Button("SIGN UP"){
                        print("testing signup button")
                    }
                    .buttonStyle(BlueButton())
                    .padding()
                }
                
                Spacer()
                
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}