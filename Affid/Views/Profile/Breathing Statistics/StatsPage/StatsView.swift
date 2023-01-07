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
            
            VStack(alignment: .leading){
                Text("Statistics")
                    .padding()
                    .foregroundColor(.white)
                    .font(.title)
                    .fontWeight(.light)
                ScrollView{
                    
                    NavigationLink {
                        HomeView()
                    } label: {
                        TotalSessionsView(statsVm: statsVm)
                    }
                    
                    NavigationLink {
                        TotalAverageSesionLengthView(statsVm: statsVm)
                    } label: {
                        AverageSessionLengthView(statsVm: statsVm)
                    }

                    NavigationLink {
                        HomeView()
                    } label: {
                        AverageHoldTimePerSessionView(statsVm: statsVm)
                    }                    
                }
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
