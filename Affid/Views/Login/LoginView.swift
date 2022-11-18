//
//  LoginView.swift
//  Affid
//
//  Created by David on 2022-11-18.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        ZStack{
            ColorData.shared.backGroundColor
                .edgesIgnoringSafeArea(.all)
            VStack{
                
                Spacer()

                LoginCloudsView()
                
                HStack{
                    Text("Hi there! Login below")
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                }
                
                LoginExternalPlatformView()
                
                HStack{
                    Text("OR LOGIN WITH EMAIL")
                        .foregroundColor(.gray)
                        .font(.footnote)
                }
                .padding()
                
                LoginFormView()
                
                HStack{
                    Text("RESET PASSWORD")
                        .foregroundColor(.gray)
                        .font(.footnote)
                        .offset(x: -100)
                } // need to align properly without depending on offset
                
                Spacer()
                
                HStack {
                    Button("LOG IN"){
                        print("testing login button")
                    }
                    .buttonStyle(BlueButton())
                    .padding()
                }
                Spacer()
            }
        }
        .toolbar{
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
