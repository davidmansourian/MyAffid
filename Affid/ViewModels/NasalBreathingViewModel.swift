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
    @Published var sessionTracker: [BreathHoldModel] = [] // needs to be emptied when the session is intialized (not via init tho)
    
    let oneSecondTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect() // 1 sec timer
    let breathingTimer = Timer.publish(every: 4, on: .main, in: .common).autoconnect() // breathcounter-timer // make generic timer for all that publish ever 1 sec
    
    
    
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
        self.sessionTracker.append(BreathHoldModel(round: self.round, timeBreathHeld: self.breathHoldSecondsFinished))
        if self.breathHoldSecondsFinished > longestRound{
            longestRound = self.breathHoldSecondsFinished
        }
        print(sessionTracker)
    }
    
    func convertSecondsToTime(timeInSeconds: Int) -> String{
        let minutes = timeInSeconds / 60
        let seconds = timeInSeconds % 60
        
        return String(format: "%0i:%02i", minutes, seconds)
    }
}
