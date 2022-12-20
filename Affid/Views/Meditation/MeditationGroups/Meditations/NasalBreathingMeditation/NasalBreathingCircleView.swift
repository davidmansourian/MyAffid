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
            Color(.gray)
            VStack {
                ZStack{
                    Circle()
                        .fill(.white.opacity(0.1))
                        .frame(width: 230, height: 230)
                        .scaleEffect(scale)
                        .animation(.easeOut(duration: 2).repeatCount((2*(nasalBreathingVm.totalBreaths)), autoreverses: true), value: nasalBreathingVm.animate)
                    
                    Circle()
                        .fill(ColorData.shared.appSystemYellow)
                        .frame(width: 185, height: 185)
                        .shadow(color: .yellow, radius: 5)
                        .scaleEffect(innerCircleScale)
                        .animation(.easeInOut(duration: 1.98).repeatCount((2*(nasalBreathingVm.totalBreaths)), autoreverses: true), value: nasalBreathingVm.animate)
                    
                }
            }
            
            .onAppear{
                nasalBreathingVm.animate.toggle()
                self.scale = nasalBreathingVm.animate ? 1.0 : 0.2
                self.innerCircleScale = nasalBreathingVm.animate ? 1.0 : 0.5
                
            }
        }
    }
}
