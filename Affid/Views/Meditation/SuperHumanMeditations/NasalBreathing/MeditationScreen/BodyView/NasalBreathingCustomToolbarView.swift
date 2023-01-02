//
//  NasalBreathingCustomToolbarView.swift
//  Affid
//
//  Created by David on 2023-01-02.
//

import SwiftUI

struct NasalBreathingCustomToolbarView: View {
    @StateObject var nasalBreathingVm: NasalBreathingViewModel
    @Environment(\.dismiss) var dismiss
    
    init(nasalBreathingVm: NasalBreathingViewModel){
        _nasalBreathingVm = StateObject(wrappedValue: nasalBreathingVm)
    }
    var body: some View {
        HStack{
                Button {
                    dismiss()
                    Task{
                        nasalBreathingVm.cleanSession()
                    }
                } label: {
                    Image(systemName: "x.circle")
                        .foregroundColor(.white)
                        .font(.title)
                        .fontWeight(.bold)
                }
                .padding()
            
            Spacer()
            
            if nasalBreathingVm.roundState != NasalBreathingRoundState.finished && nasalBreathingVm.firstRoundBreathHoldComplete{
                Button {
                    nasalBreathingVm.sessionCounterTimer.upstream.connect().cancel()
                    nasalBreathingVm.roundState = NasalBreathingRoundState.finished
                    nasalBreathingVm.saveSession()
                } label: {
                    Text("Finish")
                        .foregroundColor(.white)
                        .font(.title3)
                        .fontWeight(.bold)
                }
                .padding()
            }
        }
    }
}
