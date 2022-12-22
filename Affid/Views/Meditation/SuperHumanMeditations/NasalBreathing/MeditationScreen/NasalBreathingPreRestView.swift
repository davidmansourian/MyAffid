//
//  NasalBreathingPreRestView.swift
//  Affid
//
//  Created by David on 2022-12-22.
//

import SwiftUI

struct NasalBreathingPreRestView: View {
    @StateObject var nasalBreathingVm: NasalBreathingViewModel
    @State var restTimer: Int = 15
    
    init(nasalBreathingVm: NasalBreathingViewModel){
        _nasalBreathingVm = StateObject(wrappedValue: nasalBreathingVm)
    }
    
    var body: some View {
        VStack{
            Text("Take a deep breath and hold")
                .foregroundColor(.white)
                .font(.title)
                .fontWeight(.bold)
            
            Text("\(restTimer)")
                .onReceive(nasalBreathingVm.preRestInhaleTimer) { _ in
                    if restTimer > 1{
                        restTimer -= 1
                    }
                    else if restTimer == 1{
                        nasalBreathingVm.preRestInhaleTimer.upstream.connect().cancel()
                        nasalBreathingVm.roundState = RoundState.breathing
                    }
                }
        }
    }
}
