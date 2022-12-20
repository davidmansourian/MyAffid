//
//  NasalMusicChoiceView.swift
//  Affid
//
//  Created by David on 2022-12-20.
//

import SwiftUI

struct NasalMusicChoiceView: View {
    @StateObject var nasalBreathingVm: NasalBreathingViewModel
    @State var retentionPhaseMusic = false
    @State var breathingPhaseMusic = false
    
    init(nasalBreathingVm: NasalBreathingViewModel){
        _nasalBreathingVm = StateObject(wrappedValue: nasalBreathingVm)
    }
    
    var body: some View {
        Group{
            Toggle("Breathing Phase Music", isOn: $breathingPhaseMusic)
                .font(.title3)
                .fontWeight(.medium)
                .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
                .foregroundColor(.white)
                .padding(.horizontal, 30)
                .toggleStyle(CheckmarkToggleView())
                .padding(.top, 30)
                .onChange(of: breathingPhaseMusic) { newValue in
                    nasalBreathingVm.breathingPhaseMusic = newValue
                }
            
            DividerView()
            
            Toggle("Retention Phase Music", isOn: $retentionPhaseMusic)
                .foregroundColor(retentionPhaseMusic ? .white : .white)
                .font(.title3)
                .fontWeight(.medium)
                .shadow(color: Color.black.opacity(0.2), radius: 3, x: 0, y: 2)
                .padding(.horizontal, 30)
                .toggleStyle(CheckmarkToggleView())
                .onChange(of: retentionPhaseMusic) { newValue in
                    nasalBreathingVm.retentionPhaseMusic = newValue
                }
        }
    }
}
