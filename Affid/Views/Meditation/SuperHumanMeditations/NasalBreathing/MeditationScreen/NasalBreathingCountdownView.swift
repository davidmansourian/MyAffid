//
//  NasalBreathingCountdownView.swift
//  Affid
//
//  Created by David on 2022-12-21.
//

import SwiftUI

struct NasalBreathingCountdownView: View {
    @StateObject var nasalBreathingVm: NasalBreathingViewModel
    @State var counter = 0
    
    init(nasalBreathingVm: NasalBreathingViewModel){
        _nasalBreathingVm = StateObject(wrappedValue: nasalBreathingVm)
    }
    var body: some View {
        VStack{
            Text("Get Ready")
                .foregroundColor(ColorData.shared.appSystemYellow)
                .font(.largeTitle)
                .fontWeight(.heavy)
            Text("\(nasalBreathingVm.countdown)")
                .foregroundColor(.white)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .onReceive(nasalBreathingVm.countdownTimer) { _ in
                    if nasalBreathingVm.countdown > 0{
                        nasalBreathingVm.countdown -= 1
                    }
                    else if nasalBreathingVm.countdown == 0{
                        nasalBreathingVm.countdownTimer.upstream.connect().cancel() // in while-loop, at the beginning of the loop
                        // For each round, i need to be checking if countdown is 0. Then when user exits meditation, I need to reset the countdown to 5 seconds
                        withAnimation(.default){
                            nasalBreathingVm.roundState = RoundState.breathing
                        }
                        
                    }
                }
        }
        .onDisappear{
            nasalBreathingVm.countdownTimer.upstream.connect().cancel()
        }
    }
}
