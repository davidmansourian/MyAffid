//
//  LoginView.swift
//  Affid
//
//  Created by David on 2022-11-18.
//

import SwiftUI

struct LoginView: View {
    @State var email: String = ""
    @State var password: String = ""
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack{
            ColorData.shared.backGroundColor
                .edgesIgnoringSafeArea(.all)
            VStack{
                
                Spacer()
                
                LoginCloudsView()
                
                Group{
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
                }
                VStack(spacing: -10){
                    CustomTextField(placeHolderText: "Email Address", text: $email)
                    CustomTextField(placeHolderText: "Password", text: $password)
                }
                
                
                HStack{
                    NavigationLink(
                        destination: ResetPasswordView(),
                        label:{ Text("RESET PASSWORD")
                        })
                    .foregroundColor(.gray)
                    .font(.footnote)
                    Spacer()
                }
                .padding(.horizontal, 30)
                
                Spacer()
                
                NavigationLink(
                    destination: MainTabView(),
                    label:{ Text("Login")
                    })
                    .buttonStyle(BlueButton())
                    .padding()
                
                
                Spacer()
            }
        }
        .toolbar{
            ToolbarItemGroup(placement: .navigationBarLeading){
                // Solution below was taken from //https://stackoverflow.com/a/58159783
                Button(action: { self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.backward")
                        .foregroundColor(Color.white)
                        .padding(10)
                        .overlay(
                            Circle()
                                .stroke(.white))
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
