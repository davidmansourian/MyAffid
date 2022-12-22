//
//  NasalBreathingBodyView.swift
//  Affid
//
//  Created by David on 2022-12-20.
//

import SwiftUI

struct NasalBreathingBodyView: View {
    @StateObject var nasalBreathingVm: NasalBreathingViewModel
    @Environment(\.dismiss) var dismiss
    
    init(nasalBreathingVm: NasalBreathingViewModel){
        _nasalBreathingVm = StateObject(wrappedValue: nasalBreathingVm)
    }
    var body: some View{
        NavigationStack{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [ColorData.shared.theLighterGreen, ColorData.shared.theDarkerGreen, .white]), startPoint: .top, endPoint: .bottom).opacity(1)
                    .cornerRadius(10)
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Text("Round \(nasalBreathingVm.round)")
                        .foregroundColor(.white)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                    
                    Spacer()
                    
                    switch nasalBreathingVm.roundState{
                    case .countdown:
                        NasalBreathingCountdownView(nasalBreathingVm: nasalBreathingVm)
                    case .breathing:
                        NasalBreathingCircleView(nasalBreathingVm: nasalBreathingVm)
                    case .prepareHold:
                        NasalBreathingHoldWarningView(nasalBreathingVm: nasalBreathingVm)
                    case .hold:
                        NasalBreathingHoldView(nasalBreathingVm: nasalBreathingVm)
                    case .rest:
                        NasalBreathingRestView(nasalBreathingVm: nasalBreathingVm)
                    case .exhaleRest:
                        NasalBreathingBreatheOutRestView(nasalBreathingVm: nasalBreathingVm)
                    }
                    
                    Spacer()
                    Spacer()
                    Spacer()
                }
            }
            .onTapGesture(count: 2, perform: {
                if nasalBreathingVm.roundState == RoundState.hold{
                    nasalBreathingVm.holdStop = true
                }
            })
            .toolbar{
                ToolbarItemGroup(placement: .navigationBarLeading){
                    Button {
                        dismiss()
                        Task{
                            await nasalBreathingVm.cleanSession()
                        }
                    } label: {
                        Image(systemName: "x.circle")
                            .foregroundColor(.white)
                            .font(.title)
                    }
                    
                }
            }
        }
    }
}

