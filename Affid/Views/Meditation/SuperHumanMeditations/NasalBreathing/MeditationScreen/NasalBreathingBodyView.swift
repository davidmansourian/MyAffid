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
                
                NasalBreathingCircleView(nasalBreathingVm: nasalBreathingVm)
            }
            .toolbar{
                ToolbarItemGroup(placement: .navigationBarLeading){
                    Button {
                        dismiss()
                        Task{
                            await nasalBreathingVm.cleanSelections()
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

