//
//  BreathingCircle.swift
//  BreathingCircle
//
//  Created by David on 2022-12-02.
//

import SwiftUI

struct BreathingCircleView: View {
    @State private var scale = 0.9
    @State private var innerCircleScale = 0.9
    @State private var animate = false
    @StateObject var timerVm = TimerViewModel()
    var body: some View {
        ZStack{
            
            CirclesView()
            
            VStack{
                
                TimerView(timerVm: timerVm)
            }
            .onReceive(timerVm.timer){ _ in
                timerVm.updateCountdownw()
            }
            .sheet(isPresented: $timerVm.showingAlert, onDismiss: {timerVm.showingAlert = false}){
                MeditationFinishedSheet()
            }
            
        }
    }
}
