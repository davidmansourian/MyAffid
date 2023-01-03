//
//  NasalBreathingHoldView.swift
//  Affid
//
//  Created by David on 2022-12-20.
//

import SwiftUI

struct NasalBreathingHoldView: View {
    @StateObject var nasalBreathingVm: NasalBreathingViewModel
    @State var breathHoldSec: Int = 0
    @State var stop: Bool = false
    
    init(nasalBreathingVm: NasalBreathingViewModel){
        _nasalBreathingVm = StateObject(wrappedValue: nasalBreathingVm)
    }
    var body: some View {
        ZStack{
            VStack{
                Text("Hold your breath for as long as you can")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.light)
                    .padding()
                
                Text("\(nasalBreathingVm.convertSecondsToTime(timeInSeconds: breathHoldSec))")
                    .foregroundColor(ColorData.shared.appSystemYellow)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                    .onReceive(nasalBreathingVm.oneSecondTimer) { _ in
                        if !nasalBreathingVm.holdStop{
                            breathHoldSec += 1
                        }
                        else if nasalBreathingVm.holdStop{
                            nasalBreathingVm.oneSecondTimer.upstream.connect().cancel()
                            nasalBreathingVm.breathHoldSecondsFinished = breathHoldSec
                            nasalBreathingVm.roundsHeld += 1
                            nasalBreathingVm.appendSessionTracker()
                            withAnimation(.default){
                                nasalBreathingVm.roundState = NasalBreathingRoundState.rest
                            }
                        }
                    }
                
                Text("Double tap to rest")
                    .foregroundColor(.white)
                    .font(.title)
                    .fontWeight(.light)
                    .padding()
            }
        }
        .onAppear{
            nasalBreathingVm.theStartDate = Date().timeIntervalSince1970
        }
        .onDisappear{
            nasalBreathingVm.theEndDate = Date().timeIntervalSince1970
            nasalBreathingVm.holdStop = false
        }
    }
}
