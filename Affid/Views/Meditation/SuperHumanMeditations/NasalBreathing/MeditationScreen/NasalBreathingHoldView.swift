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
            VStack(spacing: 100){
                Text("Hold your breath for as long as you can")
                    .foregroundColor(.white)
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("\(breathHoldSec)")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.light)
                    .onReceive(nasalBreathingVm.breathHoldTimer) { _ in
                        if !stop{
                            breathHoldSec += 1
                        }
                        else if stop{
                            nasalBreathingVm.breathHoldTimer.upstream.connect().cancel()
                            nasalBreathingVm.breathHoldSeconds = breathHoldSec
                            nasalBreathingVm.appendSessionTracker()
                            nasalBreathingVm.roundState = RoundState.rest
                        }
                    }
                
                Text("Double tap to rest")
                    .foregroundColor(.white)
                    .font(.title)
                    .fontWeight(.bold)
            }
        }
        .onTapGesture(count: 2){
            stop = true
        }
        .onDisappear{
            stop = false
            nasalBreathingVm.breathHoldTimer.upstream.connect().cancel()
        }
    }
}
