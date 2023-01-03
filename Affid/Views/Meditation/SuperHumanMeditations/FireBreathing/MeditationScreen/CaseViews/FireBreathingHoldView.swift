//
//  FireBreathingHoldView.swift
//  Affid
//
//  Created by David on 2022-12-25.
//

import SwiftUI

struct FireBreathingHoldView: View {
    @StateObject var fireBreathingVm: FireBreathingViewModel
    @State var breathHoldSec: Int = 0
    @State var stop: Bool = false
    
    
    
    init(fireBreathingVm: FireBreathingViewModel){
        _fireBreathingVm = StateObject(wrappedValue: fireBreathingVm)
    }
    var body: some View {
        VStack{
            Text("\(fireBreathingVm.convertSecondsToTime(timeInSeconds: breathHoldSec))")
                .foregroundColor(ColorData.shared.appSystemBlue)
                .font(.title)
                .fontWeight(.bold)
                .padding()
                .onReceive(fireBreathingVm.oneSecondTimer) { _ in
                    if !fireBreathingVm.holdStop{
                        breathHoldSec += 1
                    }
                    else if fireBreathingVm.holdStop{
                        fireBreathingVm.oneSecondTimer.upstream.connect().cancel()
                        fireBreathingVm.breathHoldSecondsFinished = breathHoldSec
                        fireBreathingVm.appendSessionTracker()
                        fireBreathingVm.round += 1
                        fireBreathingVm.roundsHeld += 1
                        withAnimation(.default){
                            fireBreathingVm.roundState = FireBreathingRoundState.normalBreathing
                        }
                    }
                }
        }
        .onDisappear{
            fireBreathingVm.holdStop = false
        }
    }
}
