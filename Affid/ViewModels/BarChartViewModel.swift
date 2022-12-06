//
//  BarChartViewModel.swift
//  BreathingCircle
//
//  Created by David on 2022-12-05.
//

import Foundation
import Combine
import SwiftUI

class BarChartViewModel: ObservableObject{
    private var coreDataManager = CoreDataManager.shared
    @Published var yearlyChart: [Bar] = []
    private var monthlyCountArr: [MonthCount] = []
    
    
    init(){
        loadBarChart()
    }
    
    
    func loadMonthCountWithMonth(){
        for i in 1...12{
            monthlyCountArr.append(MonthCount(month: i, count: 0))
        }
    }
    
    
    func getYearlyStats(){
        for session in coreDataManager.getSessionsPerMonth(){
            let monthInt = Calendar.current.component(.month, from: session.date!)
            monthlyCountArr[monthInt-1].count += 1 // minus 1 because dictionary loads from 0 to 11
        }
    }
    
    func loadBarChart(){
        monthlyCountArr.removeAll()
        loadMonthCountWithMonth()
        getYearlyStats()
        let color: Color = ColorData.shared.appSystemYellow
        let months = ["January", "February", "Mmars", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
        
        for month in monthlyCountArr{
            let barItem = Bar(name: "\(month.month)", month: months[month.month-1], value: Double(month.count), color: color)
            yearlyChart.append(barItem)
        }
        
    }
}
