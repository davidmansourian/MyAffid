//
//  FireBreathingViewModel.swift
//  Affid
//
//  Created by David on 2022-12-25.
//

import Foundation

class FireBreathingViewModel: ObservableObject{
    private var hasExited: Bool = false
    @Published var sessionTracker: [BreathHoldModel] = [] // needs to be emptied when the session is intialized (not via init tho)
    @Published var roundState = FireBreathingRoundState.normalBreathing
    
    let oneSecondTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect() // 1 sec timer
    
}
