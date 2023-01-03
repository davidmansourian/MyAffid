//
//  FireBreathingViewModel.swift
//  Affid
//
//  Created by David on 2022-12-25.
//

import Foundation

class FireBreathingViewModel: ObservableObject{
    private var hasExited: Bool = false
    private var totalHoldLength: Int = 0
    private var averageHoldLength: Int = 0
    private var meditationType: String = "Fire Breathing"
    
    
    @Published var roundsHeld: Int = 0
    @Published var breathingPhaseMusic: Bool = false
    @Published var retentionPhaseMusic: Bool = false
    @Published var sessionTracker: [BreathHoldModel] = [] // needs to be emptied when the session is intialized (not via init tho)
    @Published var sessionSelection: [FireBreathingSettingsData] = []
    @Published var roundState = FireBreathingRoundState.normalBreathing
    @Published var holdStop: Bool = false
    @Published var breathHoldSecondsFinished: Int = 0
    @Published var round: Int = 1
    @Published var longestRound: Int = 0
    @Published var roundForLongestHold: Int = 1
    @Published var firstRoundBreathHoldComplete: Bool = false
    @Published var sessionLength: Float = 0
    
    
    let sessionCounterTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let oneSecondTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect() // 1 sec timer
    
    func getNasalBreathSettings(){
        hasExited = false
        self.sessionSelection.removeAll()
        self.sessionSelection.append(FireBreathingSettingsData(breathingPhaseMusic: self.breathingPhaseMusic, retentionPhaseMusic: self.retentionPhaseMusic))
        print("Data appended")
        print(self.sessionSelection)
    }
    
    func appendSessionTracker(){
        self.totalHoldLength += self.breathHoldSecondsFinished
        self.sessionTracker.append(BreathHoldModel(round: String("\(self.round)"), timeBreathHeld: self.breathHoldSecondsFinished))
        if self.breathHoldSecondsFinished > longestRound{
            longestRound = self.breathHoldSecondsFinished
            self.roundForLongestHold = self.round
        }
        print(sessionTracker)
    }
    
    func saveSession(){
        self.averageHoldLength = self.totalHoldLength / self.roundsHeld
        let now = Date()
        CoreDataManager.shared.storeFireBreathingSession(theSession: self.sessionTracker, theDate: now, rounds: self.round, longestHold: self.longestRound, longestHoldRound: self.roundForLongestHold, sessionLength: self.sessionLength, averageHoldLength: self.averageHoldLength, sessionType: self.meditationType)
    }
    
    func cleanSession(){
        self.roundsHeld = 0
        self.longestRound = 0
        self.roundForLongestHold = 1
        self.sessionLength = 0
        self.averageHoldLength = 0
        self.totalHoldLength = 0
        self.sessionTracker.removeAll()
        self.breathingPhaseMusic = false
        self.retentionPhaseMusic = false
        self.firstRoundBreathHoldComplete = false
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
