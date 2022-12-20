//
//  SplashScreenView.swift
//  Affid
//
//  Created by David on 2022-11-22.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    var body: some View {
        if isActive{
            ContentView()
        }
        else{
            ZStack{
                ColorData.shared.backGroundColor
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Image("bird")
                    Text("Affid")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .bold()
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear{
                    withAnimation(.easeIn(duration: 1.2)){
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                    withAnimation{
                        self.isActive = true
                    }
                }
            }
        }
    }
}
