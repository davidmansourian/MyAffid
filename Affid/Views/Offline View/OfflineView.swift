//
//  OfflineView.swift
//  Affid
//
//  Created by David on 2022-12-07.
//

import SwiftUI

struct OfflineView: View {
    @State var didAppear: Bool = false
    var body: some View {
        ZStack{
            ColorData.shared.backGroundColor
                .edgesIgnoringSafeArea(.all)
            
            LoginCloudsView()
                .offset(y: -50)
            
            VStack(spacing: 40){
                Text("Welcome!")
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
            .alert("You have limited access because you are not connected to the internet. Please restart the app if you want to go online" ,isPresented: $didAppear) {
                Button("OK", role: .cancel) { }
            }

        }
        .onAppear{
            didAppear = true
        }
    }
}
