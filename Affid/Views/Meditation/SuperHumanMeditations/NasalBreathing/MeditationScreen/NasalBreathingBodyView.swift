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
        ZStack{
            LinearGradient(gradient: Gradient(colors: [ColorData.shared.theLighterGreen, ColorData.shared.theDarkerGreen, .white]), startPoint: .top, endPoint: .bottom).opacity(1)
                .cornerRadius(10)
                .edgesIgnoringSafeArea(.all)
            VStack{
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
                            nasalBreathingVm.roundState = NasalBreathingRoundState.finished
                        } label: {
                            Text("Finish")
                                .foregroundColor(.white)
                                .font(.title3)
                                .fontWeight(.bold)
                        }
                        .padding()
                    }
                }
                
                if nasalBreathingVm.roundState != NasalBreathingRoundState.finished{
                    Text("Round \(nasalBreathingVm.round)")
                        .foregroundColor(.white)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                }
                
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
                case .finished:
                    NasalBreathingFinishedView(nasalBreathingVm: nasalBreathingVm)
                }
                
                Spacer()
                Spacer()
                Spacer()
            }
        }
        .onTapGesture(count: 2, perform: {
            if nasalBreathingVm.roundState == NasalBreathingRoundState.hold{
                nasalBreathingVm.holdStop = true
            }
            else if nasalBreathingVm.roundState == NasalBreathingRoundState.breathing{
                nasalBreathingVm.retentionIsEarly = true
            }
        })
    }
}
