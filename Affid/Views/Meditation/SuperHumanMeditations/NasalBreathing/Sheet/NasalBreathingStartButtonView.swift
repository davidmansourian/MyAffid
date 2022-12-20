//
//  NasalBreathingStartButtonView.swift
//  Affid
//
//  Created by David on 2022-12-20.
//

import SwiftUI

struct NasalBreathingStartButtonView: View {
    @StateObject var nasalBreathingVm: NasalBreathingViewModel
    var closeAndDisplayFullScreen : () -> Void
    
    init(nasalBreathingVm: NasalBreathingViewModel, closeAndDisplayFullScreen: @escaping () -> Void){
        _nasalBreathingVm = StateObject(wrappedValue: nasalBreathingVm)
        self.closeAndDisplayFullScreen = closeAndDisplayFullScreen
    }
    
    var body: some View {
        Group{
            HStack{
                Spacer()
                Button {
                    Task{
                        await nasalBreathingVm.getNasalBreathSettings()
                    }
                    closeAndDisplayFullScreen()
                } label: {
                    Text("Start")
                        .foregroundColor(.white)
                }
                .padding(20)
                .overlay(
                    Circle()
                        .stroke(ColorData.shared.appSystemYellow, lineWidth: 3)
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2))
                Spacer()
            }
            .padding(.top, 50)
        }
    }
}
