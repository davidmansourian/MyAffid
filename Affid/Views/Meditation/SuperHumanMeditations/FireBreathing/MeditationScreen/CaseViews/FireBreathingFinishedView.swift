//
//  FireBreathingFinishedView.swift
//  Affid
//
//  Created by David on 2023-01-02.
//

import SwiftUI
import Charts

struct FireBreathingFinishedView: View {
    @StateObject var fireBreathingVm: FireBreathingViewModel
    
    init(fireBreathingVm: FireBreathingViewModel){
        _fireBreathingVm = StateObject(wrappedValue: fireBreathingVm)
    }
    var body: some View {
            VStack{
                Text("Good job! Your longest breath hold was \(fireBreathingVm.longestRound) seconds")
                    .foregroundColor(.white)
                    .font(.title)
                    .fontWeight(.light)
                Chart(fireBreathingVm.sessionTracker){ session in
                    BarMark(x: .value("Round", session.round),
                            y: .value("Held", session.timeBreathHeld))
                    .foregroundStyle(ColorData.shared.appSystemYellow.gradient)
                    .cornerRadius(10)
                    .annotation{
                        Text("\(fireBreathingVm.convertSecondsToTimeString(timeInSeconds: session.timeBreathHeld))")
                            .foregroundColor(ColorData.shared.appSystemBlue)
                            .font(.callout)
                            .fontWeight(.bold)
                    }
                }
                .chartXAxis{
                    AxisMarks{ value in
                        AxisValueLabel()
                            .foregroundStyle(.white)
                            .font(.system(size: 10))
                    }
                }
                .chartYAxis{
                    AxisMarks { value in
                        AxisValueLabel(){
                            if let intValue = value.as(Int.self){
                                Text("\(fireBreathingVm.convertSecondsToTime(timeInSeconds: intValue))")
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
