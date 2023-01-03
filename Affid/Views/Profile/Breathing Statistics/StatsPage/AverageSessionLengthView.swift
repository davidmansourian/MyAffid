//
//  AverageSessionLengthView.swift
//  Affid
//
//  Created by David on 2023-01-02.
//

import SwiftUI
import Charts

struct AverageSessionLengthView: View {
    @StateObject var statsVm: StatsViewModel
    var statsBckgroundColor: Color = Color(red: 47/255, green: 49/255, blue: 54/255)
    
    init(statsVm: StatsViewModel){
        _statsVm = StateObject(wrappedValue: statsVm)
    }
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                Text("Average Session Length")
                    .foregroundColor(.white)
                    .font(.callout)
                    .fontWeight(.light)
                    .padding(.leading, 13)
                    .padding(.top, 8)
                Chart(statsVm.averageLengthForType){ element in
                    BarMark(
                        x: .value("Session", element.length), // need to account for number of times done, also need to show length in minutes
                        y: .value("Type", element.type )
                    )
                    .foregroundStyle(by: .value("Session Type", element.type ))
                }
                .padding()
                .chartXAxis{
                    AxisMarks{ value in
                        AxisValueLabel()
                            .foregroundStyle(.white)
                            .font(.system(size: 10))
                    }
                }

            }
            .frame(height: 210)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(statsBckgroundColor))
            .padding()
            
        }
        .onAppear{
            Task{
                await statsVm.getAverageSessionLength()
            }
        }

    }
}
