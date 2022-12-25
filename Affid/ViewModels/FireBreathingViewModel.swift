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
    @Published var holdStop: Bool = false
    @Published var breathHoldSecondsFinished: Int = 0
    
    let oneSecondTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect() // 1 sec timer
    
    
    
    func convertSecondsToTime(timeInSeconds: Int) -> String{
        let minutes = timeInSeconds / 60
        let seconds = timeInSeconds % 60
        
        return String(format: "%0i:%02i", minutes, seconds)
    }
    
    func cleanSession(){
        self.roundState = FireBreathingRoundState.normalBreathing
        self.holdStop = false
        self.breathHoldSecondsFinished = 0
        self.oneSecondTimer.upstream.connect().cancel()
    }
    
}
