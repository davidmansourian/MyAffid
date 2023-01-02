//
//  NasalBreathingSwitchContentView.swift
//  Affid
//
//  Created by David on 2023-01-02.
//

import SwiftUI

struct NasalBreathingSwitchContentView: View {
    @StateObject var nasalBreathingVm: NasalBreathingViewModel
    
    init(nasalBreathingVm: NasalBreathingViewModel){
        _nasalBreathingVm = StateObject(wrappedValue: nasalBreathingVm)
    }
    var body: some View {
        switch nasalBreathingVm.roundState{
        case .countdown:
            NasalBreathingCountdownView(nasalBreathingVm: nasalBreathingVm)
        case .breathing:
            NasalBreathingCircleView(nasalBreathingVm: nasalBreathingVm)
        case .prepareHold:
            NasalBreathingHoldWarningView(nasalBreathingVm: nasalBreathingVm)
        case .hold:
            NasalBreathingHoldView(nasalBreathingVm: nasalBreathingVm)
        case .rest:
            NasalBreathingRestView(nasalBreathingVm: nasalBreathingVm)
        case .exhaleRest:
            NasalBreathingBreatheOutRestView(nasalBreathingVm: nasalBreathingVm)
        case .finished:
            NasalBreathingFinishedView(nasalBreathingVm: nasalBreathingVm)
        }
    }
}
