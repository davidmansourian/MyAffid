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
    @MainActor @Published var sessionsPerDay: [SessionsPerWeekModel] = []
    @MainActor @Published var averageLengthForType: [AverageLengthForSessionTypeModel] = []
    @MainActor @Published var averageHoldForSession: [AverageHoldForSessionByDate] = []
    @MainActor @Published var averageHoldSessionsForTimeInterval: [AverageLengthForSessionTypeModel] = []
    @Published var totalMeditations: Int = 0
    @Published var favoriteMeditation: String = ""
    
    
    // First bar chart preview:
    // Total sessions (including all meditation sessions) per day / week
    // Clicking on it will reveal a picker to sort by month and year as well
    
    
    func getAverageSessionLength() async{
        await MainActor.run{
            self.averageLengthForType.append(AverageLengthForSessionTypeModel(type: "Regular", length: coreDataManager.getSessionLengthForType(meditationType: "Regular")))
            self.averageLengthForType.append(AverageLengthForSessionTypeModel(type: "Nasal Breathing", length: coreDataManager.getSessionLengthForType(meditationType: "Nasal Breathing")))
            self.averageLengthForType.append(AverageLengthForSessionTypeModel(type: "Fire Breathing", length: coreDataManager.getSessionLengthForType(meditationType: "Fire Breathing")))
            
            
        }
    }
    
    func getAverageSessionLengthForTimeInterval(startDate: Date) -> [AverageLengthForSessionTypeModel]{
        print(startDate)
        var returnArr: [AverageLengthForSessionTypeModel] = []
        returnArr.append(AverageLengthForSessionTypeModel(type: "Regular", length: coreDataManager.getAverageSessionLengthForTypeDate(meditationType: "Regular", startDate: startDate)))
        returnArr.append(AverageLengthForSessionTypeModel(type: "Nasal Breathing", length: coreDataManager.getAverageSessionLengthForTypeDate(meditationType: "Nasal Breathing", startDate: startDate)))
        returnArr.append(AverageLengthForSessionTypeModel(type: "Fire Breathing", length: coreDataManager.getAverageSessionLengthForTypeDate(meditationType: "Fire Breathing", startDate: startDate)))
        
        return returnArr
    }
    
    func getAverageHoldPerSessionForDate(startDate: Date) async{
        let calendar = NSCalendar.current
        let now = NSDate()
        
        
        print("nasalArr")
        let nasalArr = coreDataManager.getAverageHoldLengthsForType(meditationType: "Nasal Breathing", startDate: startDate, endDate: now as Date, sessionType: "nasalSession")
        // print(nasalArr)
        
        print("fireArr")
        let fireArr = coreDataManager.getAverageHoldLengthsForType(meditationType: "Fire Breathing", startDate: startDate, endDate: now as Date, sessionType: "fireSession")
        // let newArr = Array(Set(nasalArr + fireArr))
        
        
        await MainActor.run{
            self.averageHoldForSession = nasalArr + fireArr
        }
    }
    
    func getSessionsForTimeInterval(startDate: Date) async{
        let now = NSDate()
        await MainActor.run {
            self.totalCompletedMeditations = coreDataManager.countTotalTimesMeditatedCompleted()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EE"
            self.completedSsessionsArr = coreDataManager.getCompletedSessions(startDate: startDate, endDate: now as Date)
            
            for days in self.completedSsessionsArr{
                let dayOfWeek = dateFormatter.string(from: days.date ?? Date())
                sessionsPerDay.append(SessionsPerWeekModel(day: dayOfWeek, count: 1, type: days.type ?? ""))
            }
        }
    }
    
    func convertSecondsToTimeString(timeInSeconds: Int) -> String{
        let minutes = timeInSeconds / 60
        let seconds = timeInSeconds % 60
        
        return minutes > 0 ? String("\(minutes) min \(seconds) sec") : String("\(seconds) sec")
    }
}
