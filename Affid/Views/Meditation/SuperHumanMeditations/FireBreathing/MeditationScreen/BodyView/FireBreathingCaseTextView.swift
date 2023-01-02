//
//  FireBreathingCaseTextView.swift
//  Affid
//
//  Created by David on 2023-01-02.
//

import SwiftUI

struct FireBreathingCaseTextView: View {
    @StateObject var fireBreathingVm: FireBreathingViewModel
    
    init(fireBreathingVm: FireBreathingViewModel){
        _fireBreathingVm = StateObject(wrappedValue: fireBreathingVm)
    }
    var body: some View {
        switch fireBreathingVm.roundState{
        case .normalBreathing:
            Text("Breath normally")
                .foregroundColor(.white)
                .font(.largeTitle)
                .fontWeight(.light)
                .padding()
        case .exhale:
            Text("Exhale fully")
                .foregroundColor(.white)
                .font(.largeTitle)
                .fontWeight(.light)
                .padding()
        case .hold:
            Text("Hold your breath for as long as you can")
                .foregroundColor(.white)
                .font(.largeTitle)
                .fontWeight(.light)
                .padding()
        case .finished:
            Text("You did really well!")
                .foregroundColor(.white)
                .font(.largeTitle)
                .fontWeight(.light)
                .padding()
        }
    }
}
