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
    @State var breathCounter: Int = 1 // initiate breathcounter with the value of breaths selected for each round. Timer for this view publishes ever 2 secs. Every 2 secs // the number will count upwards. If breathcounter == totalBreath -> Next view
    
    init(nasalBreathingVm: NasalBreathingViewModel){
        _nasalBreathingVm = StateObject(wrappedValue: nasalBreathingVm)
    }
    
    var body: some View{
        ZStack{
            VStack {
                ZStack{
                    GenericBreathingCircleView(nasalBreathingVm: nasalBreathingVm)
                    Text("\(breathCounter)")
                        .foregroundColor(ColorData.shared.appSystemBlue)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .scaleEffect(scale)
                        .animation(.easeInOut(duration: 2).repeatCount((2*(nasalBreathingVm.totalBreaths)), autoreverses: true), value: nasalBreathingVm.animate)
                        .onReceive(nasalBreathingVm.breathingTimer) { _ in
                            if !nasalBreathingVm.retentionIsEarly{
                                if breathCounter < nasalBreathingVm.totalBreaths{
                                    breathCounter += 1
                                }
                                else if breathCounter == nasalBreathingVm.totalBreaths{
                                    nasalBreathingVm.breathingTimer.upstream.connect().cancel()
                                    withAnimation(.default){
                                        nasalBreathingVm.roundState = NasalBreathingRoundState.prepareHold
                                    }
                                }
                            }
                            else if nasalBreathingVm.retentionIsEarly{
                                nasalBreathingVm.roundState = NasalBreathingRoundState.prepareHold
                            }
                        }
                }
                Text("Double tap to enter retention")
                    .foregroundColor(.white)
                    .font(.title)
                    .fontWeight(.light)
                    .padding()
                
            }
            .onAppear{
                self.scale = nasalBreathingVm.animate ? 1.0 : 0.5
            }
            .onDisappear{
                nasalBreathingVm.animate = false
                nasalBreathingVm.retentionIsEarly = false
            }
        }
    }
}

