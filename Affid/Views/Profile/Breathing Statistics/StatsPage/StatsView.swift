//
//  StatsView.swift
//  Affid
//
//  Created by David on 2022-12-07.
//

import SwiftUI

struct StatsView: View {
    @StateObject var statsVm = StatsViewModel()
    
    var body: some View {
        ZStack{
            ColorData.shared.backGroundColor
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center){
                ScrollView{
                    
                    Text("Total Sessions")
                        .foregroundColor(.white)
                        .font(.title)
                        .fontWeight(.thin)
                        .padding(30)
                    
                    TotalSessions(statsVm: statsVm)
                    
                    Text("Sessions Completed")
                        .foregroundColor(.white)
                        .font(.title)
                        .fontWeight(.thin)
                        .padding(30)
                    
                    SessionsCompletedView(statsVm: statsVm)
                    
                    
                    Text("Favorite Meditation")
                        .foregroundColor(.white)
                        .font(.title)
                        .fontWeight(.thin)
                        .padding(30)
                    
                    FavoriteMeditationView(statsVm: statsVm)
                    
                }
                
                Image("birdOnBranch")
                    .offset(x: 100)
                
                
            }
        }
        .toolbar{
            ToolbarItemGroup(placement: .navigationBarLeading){
                ToolbarBackButtonDismiss()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

extension View {
    func animatingOverlay(for number: Double) -> some View {
        modifier(AnimatableNumberModifier(number: number))
    }
}
