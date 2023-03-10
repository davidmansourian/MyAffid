//
//  GetStartedView.swift
//  Affid
//
//  Created by David on 2022-11-18.
//

import SwiftUI

struct GetStartedView: View {
    var body: some View {
        NavigationStack{
            ZStack{
                ColorData.shared.backGroundColor
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    GetStartedCloudsView()
                    Spacer()
                    Spacer()
                    Spacer()
                    VStack(spacing: 20){
                        Text("Get Started")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                        Text("Dive deeper into yourself and experience calmness ")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                    }
                    
                   GetStartedNavigationLinks()
                    
                    Spacer()
                }
                
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct GetStartedView_Previews: PreviewProvider {
    static var previews: some View {
        GetStartedView()
    }
}
