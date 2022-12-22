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
        VStack{
            Text("Breath out fully")
                .foregroundColor(.white)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            Text("Time until hold:")
                .foregroundColor(.white)
                .font(.largeTitle)
                .fontWeight(.light)
                .padding()
            
            Text("\(countDown)")
                .foregroundColor(ColorData.shared.appSystemYellow)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
                .onReceive(nasalBreathingVm.oneSecondTimer) { _ in
                    if countDown > 0{
                        countDown -= 1
                    }
                    else if countDown == 0{
                        nasalBreathingVm.oneSecondTimer.upstream.connect().cancel()
                        withAnimation(.default){
                            nasalBreathingVm.roundState = RoundState.hold
                        }
                    }
                }
            
        }
    }
}
