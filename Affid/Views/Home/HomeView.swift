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
                    .edgesIgnoringSafeArea(.top)
                
                LoginCloudsView()
                
                VStack{
                    Spacer()
                    Text("Good morning, \(authedUser.firstName)!")
                        .foregroundColor(.white)
                        .font(.title3)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    VStack{
                        Text("Quick meditation?")
                            .foregroundColor(.white)
                            .font(.title)
                            .fontWeight(.semibold)
                    }
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
