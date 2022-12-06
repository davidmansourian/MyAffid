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
                        VStack(alignment: .leading){
                            HStack{
                                NavigationLink {
                                    //
                                } label: {
                                    Image(systemName: "bookmark.fill")
                                        .foregroundColor(.gray)
                                        .font(.title3)
                                        .fontWeight(.light)
                                    
                                    Text("Bookmarked")
                                        .foregroundColor(.white)
                                        .font(.title3)
                                        .fontWeight(.light)
                                }
                            }
                            .padding()
                            Divider()
                                .font(.system(size: 100))
                                .foregroundColor(.white)
                            HStack{
                                Button {
                                    viewModel.signOut()
                                } label: {
                                    Image(systemName: "figure.wave")
                                        .foregroundColor(.gray)
                                        .font(.title3)
                                        .fontWeight(.light)
                                    Text("Sign out")
                                        .foregroundColor(.white)
                                        .font(.title3)
                                        .fontWeight(.light)
                                    
                                }
                            }
                            .padding()
                        }
                        .frame(height: 140)
                        .frame(maxWidth: .infinity)
                        .background(ColorData.shared.profileMenuColor)
                        .cornerRadius(32)
                        .padding()
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

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
