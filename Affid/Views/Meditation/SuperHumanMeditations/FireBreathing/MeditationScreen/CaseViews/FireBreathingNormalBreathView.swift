//
//  NormalFireBreathView.swift
//  Affid
//
//  Created by David on 2022-12-25.
//

import SwiftUI

struct FireBreathingNormalBreathView: View {
    @StateObject var fireBreathingVm: FireBreathingViewModel
    @State var countdown: Int = 30
    
    init(fireBreathingVm: FireBreathingViewModel){
        _fireBreathingVm = StateObject(wrappedValue: fireBreathingVm)
    }
    var body: some View {
        VStack{
            Text("\(countdown)")
                .foregroundColor(ColorData.shared.appSystemBlue)
                .font(.title)
                .fontWeight(.bold)
                .padding()
                .onReceive(fireBreathingVm.oneSecondTimer) { _ in
                    if fireBreathingVm.round == 2{
                        fireBreathingVm.firstRoundBreathHoldComplete = true
                    }
                    if countdown > 0{
                        countdown -= 1
                    }
                    else if countdown == 0{
                        fireBreathingVm.oneSecondTimer.upstream.connect().cancel()
                        withAnimation(.default){
                            fireBreathingVm.roundState = FireBreathingRoundState.exhale
                        }
                    }
                }
        }
    }
}
