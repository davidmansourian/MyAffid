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
                    
                    Group{
                        HStack{
                            Text("Welcome back!")
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
                        CustomTextField(placeHolderText: "Password", isSecureField: true, text: $password)
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
                    
                    
                    Button {
                        viewModel.login(withEmail: email,
                                        password: password)
                    } label: {
                        Text("Login")
                    }
                    .padding()
                    .buttonStyle(BlueButton())
                    
                    
                    
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
                    ToolbarBackButtonDismiss()
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
