//
//  FireBreathingBodyView.swift
//  Affid
//
//  Created by David on 2022-12-25.
//

import SwiftUI

struct FireBreathingBodyView: View {
    @StateObject var fireBreathingVm: FireBreathingViewModel
    @Environment(\.dismiss) var dismiss
    
    init(fireBreathingVm: FireBreathingViewModel){
        _fireBreathingVm = StateObject(wrappedValue: fireBreathingVm)
    }
    var body: some View {
        NavigationStack{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [ColorData.shared.thedarkerRed, ColorData.shared.theRed, ColorData.shared.appSystemYellow]), startPoint: .top, endPoint: .bottom).opacity(1)
                    .cornerRadius(10)
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                    
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
                    }
                    
                    ZStack{
                        
                        CirclesView()
                            .padding(.top, 50)
                            .padding(.bottom, 50)
                        
                        switch fireBreathingVm.roundState{
                        case .normalBreathing:
                            FireBreathingNormalBreathView(fireBreathingVm: fireBreathingVm)
                        case .exhale:
                            FireBreathingExhaleView(fireBreathingVm: fireBreathingVm)
                        case .hold:
                            FireBreathingHoldView(fireBreathingVm: fireBreathingVm)
                        }
                    }
                    
                    if fireBreathingVm.roundState == FireBreathingRoundState.hold{
                        Text("Double tap to rest")
                            .foregroundColor(.white)
                            .font(.title)
                            .fontWeight(.light)
                            .padding()
                    }
                    
                    Spacer()
                }
            }
            .toolbar{
                ToolbarItemGroup(placement: .navigationBarLeading){
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
                }
            }
            .onTapGesture(count: 2, perform: {
                if fireBreathingVm.roundState == FireBreathingRoundState.hold{
                    fireBreathingVm.holdStop = true
                }
            })
        }
    }
}
