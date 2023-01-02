//
//  NasalBreathingBodyView.swift
//  Affid
//
//  Created by David on 2022-12-20.
//

import SwiftUI

struct NasalBreathingBodyView: View {
    @StateObject var nasalBreathingVm: NasalBreathingViewModel
    
    init(nasalBreathingVm: NasalBreathingViewModel){
        _nasalBreathingVm = StateObject(wrappedValue: nasalBreathingVm)
    }
    var body: some View{
        ZStack{
            LinearGradient(gradient: Gradient(colors: [ColorData.shared.theLighterGreen, ColorData.shared.theDarkerGreen, .white]), startPoint: .top, endPoint: .bottom).opacity(1)
                .cornerRadius(10)
                .edgesIgnoringSafeArea(.all)
            VStack{
                NasalBreathingCustomToolbarView(nasalBreathingVm: nasalBreathingVm)
                
                if nasalBreathingVm.roundState != NasalBreathingRoundState.finished{
                    NasalBreathingRoundCounterView(nasalBreathingVm: nasalBreathingVm)
                }
                
                Spacer()
                
                NasalBreathingSwitchContentView(nasalBreathingVm: nasalBreathingVm)
                
                Spacer()
                Spacer()
                Spacer()
            }
        }
        .onReceive(nasalBreathingVm.sessionCounterTimer){ _ in
            nasalBreathingVm.sessionLength += 1
        }
        .onTapGesture(count: 2, perform: {
            if nasalBreathingVm.roundState == NasalBreathingRoundState.hold{
                nasalBreathingVm.holdStop = true
                
            }
            else if nasalBreathingVm.roundState == NasalBreathingRoundState.breathing{
                nasalBreathingVm.retentionIsEarly = true
            }
        })
    }
}
