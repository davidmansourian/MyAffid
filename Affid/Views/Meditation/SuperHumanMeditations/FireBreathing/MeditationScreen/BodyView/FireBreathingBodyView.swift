//
//  FireBreathingBodyView.swift
//  Affid
//
//  Created by David on 2022-12-25.
//

import SwiftUI

struct FireBreathingBodyView: View {
    @StateObject var fireBreathingVm: FireBreathingViewModel
    
    init(fireBreathingVm: FireBreathingViewModel){
        _fireBreathingVm = StateObject(wrappedValue: fireBreathingVm)
    }
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [ColorData.shared.thedarkerRed, ColorData.shared.theRed, ColorData.shared.appSystemYellow]), startPoint: .top, endPoint: .bottom).opacity(1)
                .cornerRadius(10)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                FireBreathingCustomNavigationBarView(fireBreathingVm: fireBreathingVm)
                
                if fireBreathingVm.roundState != FireBreathingRoundState.finished{
                    FireBreathingRoundCounterView(fireBreathingVm: fireBreathingVm)
                }
                
                FireBreathingCaseTextView(fireBreathingVm: fireBreathingVm)
                
                ZStack{
                    if fireBreathingVm.roundState != FireBreathingRoundState.finished{
                        FireBreatingCirclesView(fireBreathingVm: fireBreathingVm)
                    }
                    
                    FireBreathingCaseContentView(fireBreathingVm: fireBreathingVm)
                }
                
                if fireBreathingVm.roundState == FireBreathingRoundState.hold{
                    FireBreathingTapActionView(fireBreathingVm: fireBreathingVm)
                }
                
                Spacer()
            }
        }
        .onTapGesture(count: 2, perform: {
            if fireBreathingVm.roundState == FireBreathingRoundState.hold{
                fireBreathingVm.holdStop = true
            }
        })
        
    }
}
