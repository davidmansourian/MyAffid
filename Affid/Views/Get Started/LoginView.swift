//
//  LoginView.swift
//  Affid
//
//  Created by David on 2022-11-18.
//

import SwiftUI

struct LoginView: View {
    @State var username: String = ""
    @State var password: String = ""
    var body: some View {
        ZStack{
            ColorData.shared.backGroundColor
                .edgesIgnoringSafeArea(.all)
            VStack{
                HStack{
                    Text("Hi there! Login below")
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                }
                ExternalLoginView
                HStack{
                    Text("OR LOGIN WITH EMAIL")
                        .foregroundColor(.gray)
                        .font(.footnote)
                }
                .padding()
                LoginFormView
                HStack {
                    Button("LOG IN"){
                        print("testing login button")
                    }
                    .buttonStyle(BlueButton())
                .padding()
                }
                HStack{
                    Text("RESET PASSWORD")
                        .foregroundColor(.gray)
                        .font(.footnote)
                        .frame(alignment: .leading)
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

extension LoginView{
    var ExternalLoginView: some View{
        VStack{
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
    
    
    var LoginFormView: some View{
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
                .offset(y: 20)
        }
        .padding()
    }
}
