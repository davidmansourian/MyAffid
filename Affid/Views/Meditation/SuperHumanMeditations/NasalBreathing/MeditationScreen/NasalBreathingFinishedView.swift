//
//  NasalBreathingFinishedView.swift
//  Affid
//
//  Created by David on 2022-12-23.
//

import SwiftUI
import Charts

struct NasalBreathingFinishedView: View {
    @StateObject var nasalBreathingVm: NasalBreathingViewModel
    
    init(nasalBreathingVm: NasalBreathingViewModel){
        _nasalBreathingVm = StateObject(wrappedValue: nasalBreathingVm)
    }
    
    var body: some View {
        NavigationStack{
            VStack{
                Text("Good job! Your longest breath hold was \(nasalBreathingVm.longestRound) seconds")
                    .foregroundColor(.white)
                    .font(.title)
                    .fontWeight(.light)
                Chart(nasalBreathingVm.sessionTracker){ session in
                    BarMark(x: .value("Round", session.round),
                            y: .value("Held", session.timeBreathHeld))
                    .foregroundStyle(ColorData.shared.appSystemYellow.gradient)
                    .cornerRadius(10)
                    .annotation{
                        Text("\(nasalBreathingVm.convertSecondsToTimeString(timeInSeconds: session.timeBreathHeld))")
                            .foregroundColor(ColorData.shared.appSystemBlue)
                            .font(.callout)
                            .fontWeight(.bold)
                    }
                }
                .chartXAxis{
                    AxisMarks{ value in
                        AxisValueLabel(){}
                            .foregroundStyle(.white)
                            .font(.system(size: 10))
                    }
                }
                .chartYAxis{
                    AxisMarks { value in
                        AxisValueLabel(){
                            if let intValue = value.as(Int.self){
                                Text("\(nasalBreathingVm.convertSecondsToTime(timeInSeconds: intValue))")
                                    .font(.system(size: 10))
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                            }
                        }
                    }
                }
                .padding()
                .frame(height: 350)
            }
            .padding()
        }
    }
}

struct NasalBreathingfinishedView_Previews: PreviewProvider {
    static var previews: some View {
        NasalBreathingFinishedView(nasalBreathingVm: NasalBreathingViewModel())
    }
}


