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
                
                Image("bird")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                
                Text("David")
                    .foregroundColor(.white)
                    .font(.title)
                    .fontWeight(.semibold)
                
                
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
