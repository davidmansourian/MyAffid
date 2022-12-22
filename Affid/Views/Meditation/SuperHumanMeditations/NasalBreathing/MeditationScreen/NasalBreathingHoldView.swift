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
                
                Text("\(breathHoldSec)")
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
                            nasalBreathingVm.breathHoldSeconds = breathHoldSec
                            nasalBreathingVm.appendSessionTracker()
                            withAnimation(.default){
                                nasalBreathingVm.roundState = RoundState.rest
                            }
                        }
                    }
                
                Text("Double tap to rest")
                    .foregroundColor(.white)
                    .font(.title)
                    .fontWeight(.light)
            }
        }
        .onDisappear{
            nasalBreathingVm.holdStop = false
        }
    }
}
