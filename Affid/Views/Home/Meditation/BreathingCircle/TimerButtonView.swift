//
//  TimerButtonView.swift
//  Affid
//
//  Created by David on 2022-12-06.
//

import SwiftUI

struct TimerButtonView: View {
    @StateObject var timerVm: TimerViewModel
    
    init(timerVm: TimerViewModel){
        _timerVm = StateObject(wrappedValue: timerVm)
    }
    
    var body: some View {
        HStack{
            if timerVm.isActive{
                Button {
                    timerVm.reset()
                } label: {
                    Text("Cancel")
                        .foregroundColor(.white)
                }
                .padding(20)
                .overlay(
                    Circle()
                        .stroke(ColorData.shared.appSystemYellow, lineWidth: 3)
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2))
                .toolbar(.hidden, for: .tabBar).animation(.default, value: timerVm.isActive)
            }
            else if !timerVm.isActive{
                Button {
                    timerVm.startTimer()
                    Task{
                        await SoundManager.shared.playSound(sound: .softgong)
                    }
                } label: {
                    Text("Start")
                        .foregroundColor(.white)
                }
                .padding(20)
                .overlay(
                    Circle()
                        .stroke(ColorData.shared.appSystemYellow, lineWidth: 3)
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2))
            }
        }
        .offset(y: 155)
    }
}
