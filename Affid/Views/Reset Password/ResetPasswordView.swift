//
//  ResetPasswordView.swift
//  Affid
//
//  Created by David on 2022-11-18.
//

import SwiftUI

struct ResetPasswordView: View {
    @State var resetEmail: String = ""
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var showResetLinkSentView = false
    var body: some View {
        NavigationStack{
            ZStack{
                ColorData.shared.backGroundColor
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Spacer()
                    
                    ResetPasswordContentView()
                    
                    Spacer()
                    Spacer()
                    Spacer()
                }
            }
            .alert("\(viewModel.resetError)", isPresented: $viewModel.isResetError) {
                Button("OK", role: .cancel) {
                    viewModel.isResetError = false
                }
            }
            .toolbar{
                ToolbarItemGroup(placement: .navigationBarLeading){
                    ToolbarBackButtonDismiss()
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationDestination(isPresented: $viewModel.shouldSend) {
                ResetLinkSentView()
            }
        }
    }
}
