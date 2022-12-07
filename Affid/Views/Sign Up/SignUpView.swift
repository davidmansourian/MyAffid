//
//  SignUpView.swift
//  Affid
//
//  Created by David on 2022-11-18.
//

import SwiftUI

struct SignUpView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        if viewModel.loading{
            LoadingView()
        }
        else{
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
                        SignUpPrivacyPolicyRow()
                    }
                    .padding()
                    
                    Button("SIGN UP"){
                        viewModel.register(firstName: name,
                                           withEmail: email,
                                           password: password)
                    }
                    .buttonStyle(BlueButton())
                    .padding()
                    
                    Spacer()
                    
                }
            }
            .alert("\(viewModel.authError)", isPresented: $viewModel.isError) {
                Button("OK", role: .cancel) {
                    viewModel.isError = false
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
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
