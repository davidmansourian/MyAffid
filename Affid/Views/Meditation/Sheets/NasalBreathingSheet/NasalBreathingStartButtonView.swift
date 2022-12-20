//
//  NasalBreathingStartButtonView.swift
//  Affid
//
//  Created by David on 2022-12-20.
//

import SwiftUI

struct NasalBreathingStartButtonView: View {
    @StateObject var nasalBreathingVm: NasalBreathingViewModel
    
    init(nasalBreathingVm: NasalBreathingViewModel){
        _nasalBreathingVm = StateObject(wrappedValue: nasalBreathingVm)
    }
    
    var body: some View {
        Group{
            HStack{
                Spacer()
                Button {
                    Task{
                        await nasalBreathingVm.getNasalBreathSettings()
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
                Spacer()
            }
            .padding(.top, 50)
        }
    }
}
