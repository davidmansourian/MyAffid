//
//  NasalBreathingRoundCounterView.swift
//  Affid
//
//  Created by David on 2023-01-02.
//

import SwiftUI

struct NasalBreathingRoundCounterView: View {
    @StateObject var nasalBreathingVm: NasalBreathingViewModel
    
    init(nasalBreathingVm: NasalBreathingViewModel){
        _nasalBreathingVm = StateObject(wrappedValue: nasalBreathingVm)
    }
    var body: some View {
            Text("Round \(nasalBreathingVm.round)")
                .foregroundColor(.white)
                .font(.title)
                .fontWeight(.bold)
                .padding()
    }
}
