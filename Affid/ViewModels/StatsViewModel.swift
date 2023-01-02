//
//  StatsViewModel.swift
//  Affid
//
//  Created by David on 2022-12-07.
//

import Foundation


class StatsViewModel: ObservableObject{
    private var coreDataManager = CoreDataManager.shared
    @Published var totalCompletedMeditations: Int = 0
    @MainActor @Published var completedSsessionsArr: [Session] = []
    @MainActor @Published var allSessionsArr: [Session] = []
    @MainActor @Published var sessionsPerDay: [SessionsPerWeekModel] = []
    @MainActor @Published var lengthForType: [LengthForSessionTypeModel] = []
    @Published var totalMeditations: Int = 0
    @Published var favoriteMeditation: String = ""
    
    // First bar chart preview:
    // Total sessions (including all meditation sessions) per day / week
    // Clicking on it will reveal a picker to sort by month and year as well
    
    
    func getAverageSessionLength() async{
        await MainActor.run{
            self.allSessionsArr = coreDataManager.getSessions()
            
            for theSession in self.allSessionsArr{
                lengthForType.append(LengthForSessionTypeModel(type: theSession.type ?? "", length: theSession.length))
            }
            
        }
    }
    
    
    func getSessionsPerDayForWeek() async{
        let calendar = NSCalendar.current
        let now = NSDate()
        let sevenDaysAgo = calendar.date(byAdding: .day, value: -7, to: now as Date)!
        let startDate = calendar.startOfDay(for: sevenDaysAgo)
        
        await MainActor.run {
            self.totalCompletedMeditations = coreDataManager.countTotalTimesMeditatedCompleted()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EE"
            self.completedSsessionsArr = coreDataManager.getCompletedSessions(startDate: startDate, endDate: now as Date)
            
            for days in self.completedSsessionsArr{
                let dayOfWeek = dateFormatter.string(from: days.date ?? Date())
                print(days)
                sessionsPerDay.append(SessionsPerWeekModel(day: dayOfWeek, count: 1, type: days.type ?? ""))
            }
        }
        
        
    }
}
