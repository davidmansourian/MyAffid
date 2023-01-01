//
//  HomeView.swift
//  Affid
//
//  Created by David on 2022-11-21.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        if let authedUser = viewModel.currentUser{
            ZStack{
                ColorData.shared.backGroundColor
                    .edgesIgnoringSafeArea(.all)
                
                LoginCloudsView()
                    .offset(y: -50)
                
                VStack(spacing: 40){
                    Text("Hi there, \(authedUser.firstName)!")
                        .foregroundColor(.white)
                        .font(.title)
                        .fontWeight(.light)
                        .padding(.top, 80)
                    
                        Text("Quick meditation?")
                            .foregroundColor(.white)
                            .font(.title2)
                            .fontWeight(.light)
                    
                        BreathingCircleView()
                    
                    Spacer()
                    
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
