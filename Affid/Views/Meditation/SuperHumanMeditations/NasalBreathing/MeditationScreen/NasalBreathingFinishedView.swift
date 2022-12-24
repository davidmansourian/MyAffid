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
    
    let xValues = stride(from: 1, to: 10, by: 1).map{$0}
    
    var body: some View {
        Text("Good job! Your longest breath hold was \(nasalBreathingVm.longestRound) seconds")
            .foregroundColor(.white)
            .font(.title)
            .fontWeight(.light)
            .padding()
        VStack{
            Chart{
                ForEach(nasalBreathingVm.sessionTracker){ stats in
                    BarMark(x: .value("Round", stats.round), // avoid starting from 0 in array 
                            y: .value("Time", stats.timeBreathHeld))
                }
                .foregroundStyle(ColorData.shared.appSystemYellow.gradient)
                .cornerRadius(10)
            }
            .frame(height: 180)
            .chartXAxis{
                AxisMarks(position: .automatic, values: xValues){ mark in
                }
            }
            .padding()
            .chartYAxis {
                AxisMarks(position: .leading){ mark in
                    AxisValueLabel()
                }
            }
            .padding()
        }
        .background(){
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(.white.opacity(0.05).shadow(.drop(radius: 2)))
        }
        .padding()
        
        Text("Your session has been saved!")
            .foregroundColor(.white)
            .font(.title3)
            .fontWeight(.light)
            .padding()
        
    }
}

