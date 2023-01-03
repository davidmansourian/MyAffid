//
//  AverageHoldTimePerSessionView.swift
//  Affid
//
//  Created by David on 2023-01-03.
//

import SwiftUI
import Charts

struct AverageHoldTimePerSessionView: View {
    @StateObject var statsVm: StatsViewModel
    var statsBckgroundColor: Color = Color(red: 47/255, green: 49/255, blue: 54/255)
    
    init(statsVm: StatsViewModel){
        _statsVm = StateObject(wrappedValue: statsVm)
    }
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                Text("Average Hold Length Past 7 days")
                    .foregroundColor(.white)
                    .font(.callout)
                    .fontWeight(.light)
                    .padding(.leading, 13)
                    .padding(.top, 8)
                Text("Longest Nasal Hold: ")
                    .foregroundColor(.white)
                    .font(.callout)
                    .fontWeight(.bold)
                    .padding(.leading, 13)
                Text("Longest Fire Hold: ")
                    .foregroundColor(.white)
                    .font(.callout)
                    .fontWeight(.bold)
                    .padding(.leading, 13)
                Chart(statsVm.averageHoldForSession){ element in
                    LineMark(
                        x: .value("Session", element.date), // need to account for number of times done, also need to show length in minutes
                        y: .value("Average Hold", element.holdLength )
                    )
                    .foregroundStyle(by: .value("Session Type", element.type ))
                    
                    PointMark(
                        x: .value("Session", element.date), // need to account for number of times done, also need to show length in minutes
                        y: .value("Average Hold", element.holdLength )
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
            .padding(.horizontal, 10)
            .padding(.top, 5)
            
        }
        .onAppear{
            Task{
                await statsVm.getAverageHoldPerSessionForDate()
            }
            
        }
    }
}
