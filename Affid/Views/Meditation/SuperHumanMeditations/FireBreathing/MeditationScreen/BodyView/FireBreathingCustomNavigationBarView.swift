//
//  FireBreathingCustomNavigationBarView.swift
//  Affid
//
//  Created by David on 2023-01-02.
//

import SwiftUI

struct FireBreathingCustomNavigationBarView: View {
    @StateObject var fireBreathingVm: FireBreathingViewModel
    @Environment(\.dismiss) var dismiss
    
    init(fireBreathingVm: FireBreathingViewModel){
        _fireBreathingVm = StateObject(wrappedValue: fireBreathingVm)
    }
    var body: some View {
        HStack{
            Button {
                dismiss()
                Task{
                    fireBreathingVm.cleanSession()
                }
            } label: {
                Image(systemName: "x.circle")
                    .foregroundColor(.white)
                    .font(.title)
            }
            .padding()
            Spacer()
            
            if fireBreathingVm.roundState != FireBreathingRoundState.finished && fireBreathingVm.firstRoundBreathHoldComplete{
                Button {
                    fireBreathingVm.roundState = FireBreathingRoundState.finished
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
