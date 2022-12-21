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
                    
                }
            }
            .onAppear{
                nasalBreathingVm.animate.toggle()
                self.scale = nasalBreathingVm.animate ? 1.0 : 0.5
                self.innerCircleScale = nasalBreathingVm.animate ? 1.0 : 0.5
            }
            .onDisappear{
                nasalBreathingVm.animate.toggle()
            }
        }
    }
}

