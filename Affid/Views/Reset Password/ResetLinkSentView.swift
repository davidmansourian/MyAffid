//
//  ResetLinkSentView.swift
//  Affid
//
//  Created by David on 2022-11-22.
//

import SwiftUI

struct ResetLinkSentView: View {
    var body: some View {
        ZStack{
            
            ColorData.shared.backGroundColor
                .edgesIgnoringSafeArea(.all)
            
            LoginCloudsView()
                .offset(y: -220)
            VStack{
                Text("Reset Instructions sent to your email!")
                    .foregroundColor(.white)
                    .font(.title3)
                    .bold()
                    .padding()
                
                Image("bird")
                    .padding()
                
                NavigationLink(
                    destination: GetStartedView(),
                    label:{ Text("Continue")
                    }
                )
                .buttonStyle(BlueButton())
                .padding()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct ResetLinkSentView_Previews: PreviewProvider {
    static var previews: some View {
        ResetLinkSentView()
    }
}
