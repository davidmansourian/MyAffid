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
    
    
    @Published var roundsArr: [BreathCoundModel] = []
    
    @MainActor @Published var round: Int = 1
    @MainActor @Published var breathingPhaseMusic: Bool = false
    @MainActor @Published var retentionPhaseMusic: Bool = false
    @MainActor @Published var totalBreaths: Int = 0
    @MainActor @Published var sessionSelection: [NasalBreathingSettingsData] = []
    @MainActor @Published var animate: Bool = false
    @MainActor @Published var roundState = RoundState.self
    
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
    
    func cleanSelections() async{
        await MainActor.run(body: {
            self.breathingPhaseMusic = false
            self.retentionPhaseMusic = false
            self.totalBreaths = 0
            self.sessionSelection.removeAll()
        })
        hasExited = true
        
    }
    
    func runRound(){
        while !hasExited{
            
        }
    }
}
