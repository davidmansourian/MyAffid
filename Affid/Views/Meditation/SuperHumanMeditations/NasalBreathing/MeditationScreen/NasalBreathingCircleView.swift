//
//  NasalBreathingCircleView.swift
//  Affid
//
//  Created by David on 2022-12-20.
//

import SwiftUI

struct NasalBreathingCircleView: View {
    @StateObject var nasalBreathingVm: NasalBreathingViewModel
    @State private var scale = 0.2
    @State private var innerCircleScale = 0.5
    @State var breathCounter: Int = 1 // initiate breathcounter with the value of breaths selected for each round. Timer for this view publishes ever 2 secs. Every 2 secs // the number will count upwards. If breathcounter == totalBreath -> Next view
    
    init(nasalBreathingVm: NasalBreathingViewModel){
        _nasalBreathingVm = StateObject(wrappedValue: nasalBreathingVm)
    }
    
    var body: some View{
        ZStack{
            VStack {
                ZStack{
                    Circle()
                        .fill(ColorData.shared.appSystemYellow.opacity(0.9))
                        .frame(width: 230, height: 230)
                        .scaleEffect(scale)
                        .animation(.easeInOut(duration: 2).repeatCount((2*(nasalBreathingVm.totalBreaths)), autoreverses: true), value: nasalBreathingVm.animate)
                    Text("\(breathCounter)")
                        .foregroundColor(ColorData.shared.appSystemBlue)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .scaleEffect(scale)
                        .animation(.easeInOut(duration: 2).repeatCount((2*(nasalBreathingVm.totalBreaths)), autoreverses: true), value: nasalBreathingVm.animate)
                        .onReceive(nasalBreathingVm.breathingTimer) { _ in
                            if breathCounter < nasalBreathingVm.totalBreaths{
                                breathCounter += 1
                            }
                            else if breathCounter == nasalBreathingVm.totalBreaths{
                                nasalBreathingVm.breathingTimer.upstream.connect().cancel()
                                withAnimation(.default){
                                    nasalBreathingVm.roundState = RoundState.prepareHold
                                }
                            }
                        }
                    
                }
            }
            .onAppear{
                nasalBreathingVm.animate = true
                self.scale = nasalBreathingVm.animate ? 1.0 : 0.5
                self.innerCircleScale = nasalBreathingVm.animate ? 1.0 : 0.5
            }
            .onDisappear{
                nasalBreathingVm.animate = false
                breathCounter = 1
                nasalBreathingVm.breathingTimer.upstream.connect().cancel()
            }
        }
    }
}

