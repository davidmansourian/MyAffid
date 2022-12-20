//
//  BreathCountViewModel.swift
//  Affid
//
//  Created by David on 2022-11-26.
//

import Foundation
import Combine


class NasalBreathingViewModel: ObservableObject{
    private var cancellable: Cancellable?
    @Published var roundsArr: [BreathCoundModel] = []
    @Published var breathingPhaseMusic: Bool = false
    @Published var retentionPhaseMusic: Bool = false
    @Published var totalBreaths: Int = 0
    @MainActor @Published var sessionSelection: [NasalBreathingSettingsData] = []
    @MainActor @Published var animate: Bool = false
    private var cancellableSet = Set<AnyCancellable>()
    
    init(){
        loadBreathModel()
    }
    
    func loadBreathModel(){
        
        for i in 1...10{
            let roundSize = BreathCoundModel(count: i*5, breathIndex: i)
            roundsArr.append(roundSize)
        }
    }
    
    func getNasalBreathSettings() async{
        await MainActor.run(body: {
            self.sessionSelection.removeAll()
            self.sessionSelection.append(NasalBreathingSettingsData(breathingPhaseMusic: self.breathingPhaseMusic, retentionPhaseMusic: self.retentionPhaseMusic, breathsPerRound: self.totalBreaths))
            print("Data appended")
            print(self.sessionSelection)
        })
    }
    
    func cleanSelections() async{
        self.breathingPhaseMusic = false
        self.retentionPhaseMusic = false
        self.totalBreaths = 0
        await MainActor.run(body: {
            self.sessionSelection.removeAll()
        })
        
    }
}
