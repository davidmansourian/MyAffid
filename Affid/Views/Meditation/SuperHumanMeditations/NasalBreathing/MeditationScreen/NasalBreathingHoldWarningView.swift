//
//  BreathHoldWarningView.swift
//  Affid
//
//  Created by David on 2022-12-21.
//

import SwiftUI

struct NasalBreathingHoldWarningView: View {
    @StateObject var nasalBreathingVm: NasalBreathingViewModel
    @State var countDown = 3
    
    init(nasalBreathingVm: NasalBreathingViewModel){
        _nasalBreathingVm = StateObject(wrappedValue: nasalBreathingVm)
    }
    var body: some View {
        VStack(spacing: 100){
            Text("Breath out fully")
                .foregroundColor(.white)
                .font(.title)
                .fontWeight(.bold)
            
            Text("Time until hold:")
                .foregroundColor(.white)
                .font(.title2)
                .fontWeight(.bold)
            
            Text("\(countDown)")
                .foregroundColor(ColorData.shared.appSystemYellow)
                .font(.title)
                .fontWeight(.bold)
                .onReceive(nasalBreathingVm.holdWarningTimer) { _ in
                    if countDown > 0{
                        countDown -= 1
                    }
                    else if countDown == 0{
                        nasalBreathingVm.holdWarningTimer.upstream.connect().cancel()
                        withAnimation(.default){
                            nasalBreathingVm.roundState = RoundState.hold
                        }
                    }
                }
            
        }
    }
}
