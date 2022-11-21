//
//  ProfileView.swift
//  Affid
//
//  Created by David on 2022-11-21.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
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
                    
                    Text("David")
                        .foregroundColor(.white)
                        .font(.title)
                        .fontWeight(.semibold)
                }
                Spacer()
                
                BreathingStatsView()
                
                Spacer()
                
                VStack(alignment: .leading){
                    HStack{
                        NavigationLink {
                            //
                        } label: {
                            Image(systemName: "figure.stand")
                                .foregroundColor(.gray)
                                .font(.title3)
                                .fontWeight(.light)

                            Text("Me")
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
                }
                .frame(height: 140)
                .frame(maxWidth: .infinity)
                .background(ColorData.shared.profileMenuColor)
                .cornerRadius(32)
                .padding()
                
                Spacer()
                Spacer()
                Spacer()
                
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
