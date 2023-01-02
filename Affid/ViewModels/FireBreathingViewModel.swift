//
//  FireBreathingViewModel.swift
//  Affid
//
//  Created by David on 2022-12-25.
//

import Foundation

class FireBreathingViewModel: ObservableObject{
    private var hasExited: Bool = false
    @Published var breathingPhaseMusic: Bool = false
    @Published var retentionPhaseMusic: Bool = false
    @Published var sessionTracker: [BreathHoldModel] = [] // needs to be emptied when the session is intialized (not via init tho)
    @Published var sessionSelection: [FireBreathingSettingsData] = []
    @Published var roundState = FireBreathingRoundState.normalBreathing
    @Published var holdStop: Bool = false
    @Published var breathHoldSecondsFinished: Int = 0
    @Published var round: Int = 1
    @Published var longestRound: Int = 0
    
    let oneSecondTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect() // 1 sec timer
    
    func getNasalBreathSettings(){
        hasExited = false
        self.sessionSelection.removeAll()
        self.sessionSelection.append(FireBreathingSettingsData(breathingPhaseMusic: self.breathingPhaseMusic, retentionPhaseMusic: self.retentionPhaseMusic))
        print("Data appended")
        print(self.sessionSelection)
    }
    
    func appendSessionTracker(){
        self.sessionTracker.append(BreathHoldModel(round: String("\(self.round)"), timeBreathHeld: self.breathHoldSecondsFinished))
        if self.breathHoldSecondsFinished > longestRound{
            longestRound = self.breathHoldSecondsFinished
        }
        print(sessionTracker)
    }
    
    func cleanSession(){
        self.breathingPhaseMusic = false
        self.retentionPhaseMusic = false
        self.sessionSelection.removeAll()
        self.roundState = FireBreathingRoundState.normalBreathing
        self.holdStop = false
        self.breathHoldSecondsFinished = 0
        self.round = 1
        self.oneSecondTimer.upstream.connect().cancel()
    }
    
    func convertSecondsToTime(timeInSeconds: Int) -> String{
        let minutes = timeInSeconds / 60
        let seconds = timeInSeconds % 60
        
        return String(format: "%0i:%02i", minutes, seconds)
    }
    
    func convertSecondsToTimeString(timeInSeconds: Int) -> String{
        let minutes = timeInSeconds / 60
        let seconds = timeInSeconds % 60
        
        return minutes > 0 ? String("\(minutes) min \(seconds) sec") : String("\(seconds) sec")
    }
    
}
