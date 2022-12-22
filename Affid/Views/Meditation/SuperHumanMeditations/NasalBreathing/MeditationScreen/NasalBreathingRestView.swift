//
//  NasalBreathingPreRestView.swift
//  Affid
//
//  Created by David on 2022-12-22.
//

import SwiftUI

struct NasalBreathingRestView: View {
    @StateObject var nasalBreathingVm: NasalBreathingViewModel
    @State var restTimer: Int = 15
    
    init(nasalBreathingVm: NasalBreathingViewModel){
        _nasalBreathingVm = StateObject(wrappedValue: nasalBreathingVm)
    }
    
    var body: some View {
        VStack{
            Text("Take a deep breath and hold")
                .foregroundColor(.white)
                .font(.largeTitle)
                .fontWeight(.light)
                .padding()
            
            Text("\(restTimer)")
                .foregroundColor(ColorData.shared.appSystemYellow)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
                .onReceive(nasalBreathingVm.oneSecondTimer) { _ in
                    if restTimer > 1{
                        restTimer -= 1
                    }
                    else if restTimer == 1{
                        nasalBreathingVm.oneSecondTimer.upstream.connect().cancel()
                        withAnimation(.default){
                            nasalBreathingVm.roundState = RoundState.exhaleRest
                        }
                    }
                }
        }
    }
}
