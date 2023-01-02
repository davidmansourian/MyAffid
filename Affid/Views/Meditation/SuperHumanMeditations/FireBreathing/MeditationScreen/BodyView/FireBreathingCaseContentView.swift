//
//  FireBreathingCaseContentView.swift
//  Affid
//
//  Created by David on 2023-01-02.
//

import SwiftUI

struct FireBreathingCaseContentView: View {
    @StateObject var fireBreathingVm: FireBreathingViewModel
    
    init(fireBreathingVm: FireBreathingViewModel){
        _fireBreathingVm = StateObject(wrappedValue: fireBreathingVm)
    }
    var body: some View {
        switch fireBreathingVm.roundState{
        case .normalBreathing:
            FireBreathingNormalBreathView(fireBreathingVm: fireBreathingVm)
        case .exhale:
            FireBreathingExhaleView(fireBreathingVm: fireBreathingVm)
        case .hold:
            FireBreathingHoldView(fireBreathingVm: fireBreathingVm)
        case .finished:
            FireBreathingFinishedView(fireBreathingVm: fireBreathingVm)
        }
    }
}
