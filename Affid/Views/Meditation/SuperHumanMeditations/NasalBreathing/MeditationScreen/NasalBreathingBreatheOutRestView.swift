//
//  NasalBreathingBreatheOutRestView.swift
//  Affid
//
//  Created by David on 2022-12-22.
//

import SwiftUI

struct NasalBreathingBreatheOutRestView: View {
    @StateObject var nasalBreathingVm: NasalBreathingViewModel
    @State var countdown: Int = 5
    
    init(nasalBreathingVm: NasalBreathingViewModel){
        _nasalBreathingVm = StateObject(wrappedValue: nasalBreathingVm)
    }
    var body: some View {
        Text("Breath out")
            .foregroundColor(.white)
            .font(.largeTitle)
            .fontWeight(.light)
            .padding()
        
        Text("\(countdown)")
            .foregroundColor(ColorData.shared.appSystemYellow)
            .font(.largeTitle)
            .fontWeight(.bold)
            .padding()
            .onReceive(nasalBreathingVm.oneSecondTimer) { _ in
                if countdown > 1{
                    countdown -= 1
                }
                else if countdown == 1{
                    nasalBreathingVm.oneSecondTimer.upstream.connect().cancel()
                    nasalBreathingVm.roundState = NasalBreathingRoundState.breathing
                    nasalBreathingVm.round += 1
                }
            }
    }
}
