//
//  ResetPasswordView.swift
//  Affid
//
//  Created by David on 2022-11-18.
//

import SwiftUI

struct ResetPasswordView: View {
    @State var email: String = ""
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var sendingResetLink = false
    @State private var showResetLinkSentView = false
    var body: some View {
        NavigationStack{
            ZStack{
                ColorData.shared.backGroundColor
                    .edgesIgnoringSafeArea(.all)
                if !sendingResetLink{
                    VStack{
                        Spacer()
                        Group{
                            HStack{
                                LoginCloudsView()
                            }
                            Spacer()
                            Text("Reset Password")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .bold()
                                .padding()
                            Text("Enter the email associated with your account below")
                                .foregroundColor(.gray)
                                .padding()
                                .font(.footnote)
                        }
                        
                        HStack{
                            CustomTextField(placeHolderText: "Email", text: $email)
                        }
                        
                        
                        Button(action: {
                            sendingResetLink = true
                            viewModel.resetPassword(withEmail: email)
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                                showResetLinkSentView = true
                                sendingResetLink = false
                            }
                        }, label: {
                            Text("Reset")
                        })
                        .buttonStyle(BlueButton())
                        .padding()
                        
                        Spacer()
                        Spacer()
                        Spacer()
                    }
                }
                else{
                    LoadingView()
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
        .navigationDestination(isPresented: $showResetLinkSentView) {
            ResetLinkSentView()
        }
    }
}

struct ResetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordView()
    }
}
