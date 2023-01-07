//
//  TotalSessionsStatsView.swift
//  Affid
//
//  Created by David on 2023-01-07.
//

import SwiftUI
import Charts

struct TotalAverageSesionLengthView: View {
    @StateObject var statsVm: StatsViewModel
    @State var timeWhen = TimeIntervalPickerModel.week
    
    
    var data: [AverageLengthForSessionTypeModel]{
        let now = NSDate()
        let calendar = NSCalendar.current
        let sevenDaysAgo = calendar.date(byAdding: .day, value: -7, to: now as Date)!
        let thirtyDaysAgo = calendar.date(byAdding: .day, value: -30, to: now as Date)!
        let oneYearAgo = calendar.date(byAdding: .day, value: -365, to: now as Date)!
        
        switch timeWhen{
        case .week:
            print("pressed week")
            return statsVm.getAverageSessionLengthForTimeInterval(startDate: sevenDaysAgo)
        case .month:
            print("pressed month")
            return statsVm.getAverageSessionLengthForTimeInterval(startDate: thirtyDaysAgo)
        case .year:
            print("pressed year")
            return statsVm.getAverageSessionLengthForTimeInterval(startDate: oneYearAgo)
        }
    }
    
    
    init(statsVm: StatsViewModel){
        _statsVm = StateObject(wrappedValue: statsVm)
    }
    var body: some View {
        ZStack {
            ColorData.shared.backGroundColor
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading){
                Picker("When", selection: $timeWhen){
                    Text("Last Week").tag(TimeIntervalPickerModel.week)
                    Text("Last Month").tag(TimeIntervalPickerModel.month)
                    Text("Last Year").tag(TimeIntervalPickerModel.year)
                }
                .pickerStyle(.segmented)
                
                Chart(data){ element in
                    withAnimation(.default){
                        BarMark(
                            x: .value("Length", element.length),
                            y: .value("Type", element.type))
                    }
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
            .frame(height: 500)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(ColorData.shared.profileMenuColor))
            .padding(.horizontal, 10)
        .padding(.top, 5)
        }
    }
}

