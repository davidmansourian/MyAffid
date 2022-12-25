//
//  FireBreathingStartButtonView.swift
//  Affid
//
//  Created by David on 2022-12-25.
//

import SwiftUI

struct FireBreathingStartButtonView: View {
    @StateObject var fireBreathingVm: FireBreathingViewModel
    var closeAndDisplayFullScreen : () -> Void
    
    init(fireBreathingVm: FireBreathingViewModel, closeAndDisplayFullScreen: @escaping () -> Void){
        _fireBreathingVm = StateObject(wrappedValue: fireBreathingVm)
        self.closeAndDisplayFullScreen = closeAndDisplayFullScreen
    }
    var body: some View {
        HStack{
            Spacer()
            Button {
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
