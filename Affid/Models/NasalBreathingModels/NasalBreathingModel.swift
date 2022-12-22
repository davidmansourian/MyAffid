//
//  NasalBreathingModel.swift
//  Affid
//
//  Created by David on 2022-12-15.
//

import Foundation


struct NasalBreathingModel{
    let chosenBreaths: Int // fixed value derived when initially starting the meditation (total breaths per round)
    let rounds: Int // is an ambigious value and will be determined sequentially after a round is finished
    let totalSessionTime: Int // is an ambigious value and determined when the meditation ends (the timer will end at the same time)
    let timeHeldPerRound: [BreathHoldModel] // Gives total time held per round
}


struct BreathHoldModel{
    let round: Int // round
    let timeBreathHeld: Int // time held
}

enum RoundState{
    case countdown, breathing, prepareHold, hold, rest, exhaleRest
}

