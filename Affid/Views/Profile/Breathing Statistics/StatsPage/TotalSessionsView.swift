//
//  TotalSessionsView.swift
//  Affid
//
//  Created by David on 2023-01-02.
//

import SwiftUI
import Charts

struct TotalSessionsView: View {
    @StateObject var statsVm: StatsViewModel
    var statsBckgroundColor: Color = Color(red: 47/255, green: 49/255, blue: 54/255)
    
    init(statsVm: StatsViewModel){
        _statsVm = StateObject(wrappedValue: statsVm)
    }
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                Text("Completed sessions this week")
                    .foregroundColor(.white)
                    .font(.callout)
                    .fontWeight(.light)
                    .padding(.leading, 10)
                    .padding(.top, 5)
                Text("\(statsVm.totalCompletedMeditations)")
                    .foregroundColor(.white)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.leading, 10)
                Chart(statsVm.sessionsPerDay){ element in
                    BarMark(
                        x: .value("Day", element.day),
                        y: .value("Sessions", element.count)
                    )
                    .foregroundStyle(by: .value("Session Type", element.type))
                }
                .chartXAxis{
                    AxisMarks{ value in
                        AxisValueLabel()
                            .foregroundStyle(.white)
                            .font(.system(size: 10))
                    }
                }
                .chartYAxis{
                    AxisMarks{ value in
                    
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
                await statsVm.getSessionsPerDayForWeek()
            }
        }
    }
}

struct TotalSessionsView_Previews: PreviewProvider {
    static var previews: some View {
        TotalSessionsView(statsVm: StatsViewModel())
    }
}
