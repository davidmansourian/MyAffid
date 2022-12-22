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
                
                switch nasalBreathingVm.roundState{
                case .countdown:
                    NasalBreathingCountdownView(nasalBreathingVm: nasalBreathingVm)
                case .breathing:
                    NasalBreathingCircleView(nasalBreathingVm: nasalBreathingVm)
                case .prepareHold:
                    NasalBreathingHoldWarningView(nasalBreathingVm: nasalBreathingVm)
                case .hold:
                    NasalBreathingHoldView(nasalBreathingVm: nasalBreathingVm)
                case .preRest:
                    NasalBreathingPreRestView(nasalBreathingVm: nasalBreathingVm)
                case .rest:
                    Text("Tjena")
                }
            }
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

