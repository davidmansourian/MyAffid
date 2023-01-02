//
//  FireBreathingModel.swift
//  Affid
//
//  Created by David on 2022-12-25.
//

import Foundation

struct FireBreathingSettingsData{
    let breathingPhaseMusic: Bool
    let retentionPhaseMusic: Bool
}



enum FireBreathingRoundState{
    case normalBreathing, exhale, hold, finished
}
