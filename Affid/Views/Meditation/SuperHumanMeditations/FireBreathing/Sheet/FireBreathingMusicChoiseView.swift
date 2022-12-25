//
//  FireBreathingMusicChoiseView.swift
//  Affid
//
//  Created by David on 2022-12-25.
//

import SwiftUI

struct FireBreathingMusicChoiseView: View {
    @StateObject var fireBreathingVm: FireBreathingViewModel
    @State var breathingPhaseMusic = false
    @State var retentionPhaseMusic = false
    
    init(fireBreathingVm: FireBreathingViewModel){
        _fireBreathingVm = StateObject(wrappedValue: fireBreathingVm)
    }
    var body: some View {
        Group{
            Toggle("Breathing Phase Music", isOn: $breathingPhaseMusic)
                .font(.title3)
                .fontWeight(.medium)
                .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
                .foregroundColor(.white)
                .padding(.horizontal, 30)
                .padding(.top, 30)
                .toggleStyle(CheckmarkToggleView())
            
            DividerView()
            
            Toggle("Retention Phase Music", isOn: $retentionPhaseMusic)
                .foregroundColor(.white)
                .font(.title3)
                .fontWeight(.medium)
                .shadow(color: Color.black.opacity(0.2), radius: 3, x: 0, y: 2)
                .padding(.horizontal, 30)
                .toggleStyle(CheckmarkToggleView())
        }
    }
}
