//
//  FireBreathingRoundCounterView.swift
//  Affid
//
//  Created by David on 2023-01-02.
//

import SwiftUI

struct FireBreathingRoundCounterView: View {
    @StateObject var fireBreathingVm: FireBreathingViewModel
    
    init(fireBreathingVm: FireBreathingViewModel){
        _fireBreathingVm = StateObject(wrappedValue: fireBreathingVm)
    }
    var body: some View {
        Text("Round \(fireBreathingVm.round)")
            .foregroundColor(.white)
            .font(.title)
            .fontWeight(.bold)
            .padding()
    }
}
