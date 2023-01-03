//
//  BreathCountViewModel.swift
//  Affid
//
//  Created by David on 2022-11-26.
//

import Foundation
import Combine


class NasalBreathingViewModel: ObservableObject{
    private var hasExited: Bool = false
    private var meditationType: String = "Nasal Breathing"
    private var totalHoldLength: Int = 0
    private var averageHoldLength: Int = 0
    
    @Published var longestHoldRound: Int = 1
    @Published var breathsCompleted: Int = 1
    @Published var sessionLength: Float = 0
    @Published var sessionTracker: [BreathHoldModel] = [] // needs to be emptied when the session is intialized (not via init tho)
    
    let oneSecondTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect() // 1 sec timer
    let breathingTimer = Timer.publish(every: 4, on: .main, in: .common).autoconnect() // breathcounter-timer // make generic timer for all that publish ever 1 sec
    let sessionCounterTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    
    
    @Published var roundsArr: [BreathCoundModel] = []
    
    @Published var breathingPhaseMusic: Bool = false
    @Published var retentionPhaseMusic: Bool = false
    @Published var totalBreaths: Int = 0
    @Published var sessionSelection: [NasalBreathingSettingsData] = []
    
    @Published var animate: Bool = false
    
    @Published var round: Int = 1
    @Published var firstRoundBreathHoldComplete: Bool = false
    
    @Published var retentionIsEarly: Bool = false
    @Published var roundState = NasalBreathingRoundState.countdown
    @Published var countdown: Int = 5
    @Published var holdStop: Bool = false
    @Published var breathHoldSecondsFinished: Int = 0
    
    @Published var longestRound: Int = 0
    
    @Published var theStartDate: Double = 0
    @Published var theEndDate: Double = 0
    
    
    
    init(){
        loadBreathModel()
    }
    
    func loadBreathModel(){
        
        for i in 1...10{
            let roundSize = BreathCoundModel(count: i*5, breathIndex: i)
            roundsArr.append(roundSize)
        }
        print(roundsArr)
    }
    
    func getNasalBreathSettings(){
        hasExited = false
        self.sessionSelection.removeAll()
        self.sessionSelection.append(NasalBreathingSettingsData(breathingPhaseMusic: self.breathingPhaseMusic, retentionPhaseMusic: self.retentionPhaseMusic, breathsPerRound: self.totalBreaths))
        print("Data appended")
        print(self.sessionSelection)
    }
    
    
    func cleanSession(){
        self.sessionTracker.removeAll()
        self.sessionLength = 0
        self.averageHoldLength = 0
        self.totalHoldLength = 0
        self.breathsCompleted = 1
        self.longestHoldRound = 1
        self.breathingPhaseMusic = false
        self.retentionPhaseMusic = false
        self.totalBreaths = 0
        self.sessionSelection.removeAll()
        self.roundState = NasalBreathingRoundState.countdown
        self.countdown = 5
        self.round = 1
        self.hasExited = true
        self.firstRoundBreathHoldComplete = false
        oneSecondTimer.upstream.connect().cancel()
        
    }
    
    func appendSessionTracker(){
        self.totalHoldLength += self.breathHoldSecondsFinished
        self.sessionTracker.append(BreathHoldModel(round: String("\(self.round)"), timeBreathHeld: self.breathHoldSecondsFinished))
        if self.breathHoldSecondsFinished > longestRound{
            self.longestRound = self.breathHoldSecondsFinished
            self.longestHoldRound = self.round
        }
        print(sessionTracker)
    }
    
    func saveSession(){
        self.averageHoldLength = self.totalHoldLength / self.round
        let now = Date()
        CoreDataManager.shared.storeBreathingSession(theSession: self.sessionTracker, theDate: now, rounds: self.round, longestHold: self.longestRound, longestHoldRound: self.longestHoldRound, breathsChosen: self.totalBreaths, breathsCompleted: self.breathsCompleted, sessionLength: self.sessionLength, averageHoldLength: self.averageHoldLength, sessionType: self.meditationType)
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
