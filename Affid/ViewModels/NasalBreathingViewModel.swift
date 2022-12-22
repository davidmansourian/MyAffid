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
    private var sessionTracker: [BreathHoldModel] = [] // needs to be emptied when the session is intialized (not via init tho)
    
    let countdownTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect() // countdown timer
    let breathingTimer = Timer.publish(every: 4, on: .main, in: .common).autoconnect() // breathcounter-timer // make generic timer for all that publish ever 1 sec
    let breathHoldTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let holdWarningTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let preRestInhaleTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    
    
    @Published var roundsArr: [BreathCoundModel] = []
    
    @MainActor @Published var breathingPhaseMusic: Bool = false
    @MainActor @Published var retentionPhaseMusic: Bool = false
    @MainActor @Published var totalBreaths: Int = 0
    @MainActor @Published var sessionSelection: [NasalBreathingSettingsData] = []
    
    @MainActor @Published var animate: Bool = false
    
    var round: Int = 1
    
    @MainActor @Published var roundState = RoundState.countdown
    @MainActor @Published var countdown: Int = 5
    @Published var breathHoldSeconds: Int = 0
    
    
    
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
    
    func getNasalBreathSettings() async{
        hasExited = false
        await MainActor.run(body: {
            self.sessionSelection.removeAll()
            self.sessionSelection.append(NasalBreathingSettingsData(breathingPhaseMusic: self.breathingPhaseMusic, retentionPhaseMusic: self.retentionPhaseMusic, breathsPerRound: self.totalBreaths))
            print("Data appended")
            print(self.sessionSelection)
        })
    }
    
    func cleanSession() async{
        await MainActor.run(body: {
            self.breathingPhaseMusic = false
            self.retentionPhaseMusic = false
            self.totalBreaths = 0
            self.sessionSelection.removeAll()
            self.roundState = RoundState.countdown
            self.countdown = 5
        })
        hasExited = true
        
    }
    
    func appendSessionTracker(){
        self.sessionTracker.append(BreathHoldModel(round: self.round, timeBreathHeld: self.breathHoldSeconds))
    }
    
    
    func runRound(){
        while !hasExited{
            // last rest screen need to check for full round completed
            
        }
    }
}
