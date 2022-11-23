//
//  SignUpView.swift
//  Affid
//
//  Created by David on 2022-11-18.
//

import SwiftUI

struct SignUpView: View {
    @State var name: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var acceptedPolicy = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var viewModel: AuthViewModel
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
                
                Group{
                    HStack{
                        Text("OR SIGN UP WITH EMAIL")
                            .foregroundColor(.gray)
                            .font(.footnote)
                    }
                    .padding()
                    
                    VStack(spacing: -10){
                        CustomTextField(placeHolderText: "Name", text: $name)
                        CustomTextField(placeHolderText: "Email", text: $email)
                        CustomTextField(placeHolderText: "Password", isSecureField: true, text: $password)
                    }
                }
                
                HStack{
                    Toggle("I have read the Privacy Policy", isOn: $acceptedPolicy)
                        .foregroundColor(acceptedPolicy ? .white : .gray)
                        .padding()
                        .toggleStyle(SquareCheckmarkToggleView())
                }
                .padding()
                
                    Button("SIGN UP"){
                        if(acceptedPolicy){
                            viewModel.register(firstName: name,
                                               withEmail: email,
                                               password: password)
                        }
                        else{
                            print("hasn't accepted privacy policy")
                        }
                    }
                    .buttonStyle(BlueButton())
                    .padding()
                
                Spacer()
                
            }
        }
        .toolbar{
            ToolbarItemGroup(placement: .navigationBarLeading){
                // Solution below was taken from https://stackoverflow.com/a/58159783
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

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
