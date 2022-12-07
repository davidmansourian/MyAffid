//
//  ProfileView.swift
//  Affid
//
//  Created by David on 2022-11-21.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        if let authedUser = viewModel.currentUser{
            ZStack{
                ColorData.shared.backGroundColor
                    .edgesIgnoringSafeArea(.top)
                
                VStack{
                    Spacer()
                    Group{
                        Image("bird")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100)
                        
                        Text(authedUser.firstName)
                            .foregroundColor(.white)
                            .font(.title)
                            .fontWeight(.semibold)
                    }
                    Spacer()
                    
                    BarView()
                    
                    Spacer()
                    
                    Group{
                        ProfileActionMenuView(viewModel: viewModel)
                    }
                    
                    Spacer()
                    
                    NavigationLink {
                        //
                    } label: {
                        Text("DELETE ACCOUNT")
                            .foregroundColor(.red)
                            .padding(.bottom, 40)
                    }
                }
            }
        }
    }
}
