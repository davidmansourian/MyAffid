//
//  CoreDataManager.swift
//  BreathingCircle
//
//  Created by David on 2022-11-29.
//
import Foundation
import CoreData
import Combine
import SwiftUI


class CoreDataManager: ObservableObject{
    static let shared = CoreDataManager()
    var moc = PersistenceController.shared.container.viewContext
    private var cancellable: Cancellable?
    private let queue = DispatchQueue(label: "com.Affid.CoreDataMAnager")
    
    private init(){
    }
    
    func saveSession(type: String, length: Int, completed: Bool, theDate: Date){
        let sessionEntry = Session(context: moc)
        sessionEntry.length = Float(length)
        sessionEntry.type = type
        sessionEntry.completed = completed
        sessionEntry.date = theDate
        try? moc.save()
        print("Saved session")
    }
    
    func storeNasalBreathingSession(theSession: [BreathHoldModel], theDate: Date, rounds: Int, longestHold: Int, longestHoldRound: Int, breathsChosen: Int, breathsCompleted: Int, sessionLength: Float, averageHoldLength: Int, sessionType: String){
        let dict = theSession.dictionary
        let sessionEntry = Session(context: moc)
        sessionEntry.date = theDate
        sessionEntry.completed = true
        sessionEntry.length = sessionLength
        sessionEntry.type = sessionType
        sessionEntry.nasalSession = NasalBreathingSession(context: moc)
        sessionEntry.nasalSession?.sessionContent = dict as NSObject?
        sessionEntry.nasalSession?.totalRounds = Int32(rounds)
        sessionEntry.nasalSession?.longestHold = Int32(longestHold)
        sessionEntry.nasalSession?.longestHoldRound = Int32(longestHoldRound)
        sessionEntry.nasalSession?.breaths = Int32(breathsChosen)
        sessionEntry.nasalSession?.breathsCompleted = Int32(breathsCompleted)
        sessionEntry.nasalSession?.averageHoldLength = Int32(averageHoldLength)
        try? moc.save()
        print("Saved session")
    }
    
    // https://stackoverflow.com/questions/35378820/extract-entity-from-last-seven-days-core-data
    // total timesCompleted
    func countTotalTimesMeditatedCompleted() -> Int{
        let calendar = NSCalendar.current
        let now = NSDate()
        let sevenDaysAgo = calendar.date(byAdding: .day, value: -7, to: now as Date)!
        let startDate = calendar.startOfDay(for: sevenDaysAgo)
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Session")
        let predicate = NSPredicate(format: "(date >= %@) AND (date < %@) AND completed == %@", startDate as NSDate, now, NSNumber(booleanLiteral: true))
        fetchRequest.predicate = predicate
        do {
            let count = try moc.count(for: fetchRequest)
            print(count)
            return count
        } catch let error as NSError {
            print("DEBUG: Could not fetch total meditation count \(error)")
        }
        return 0
    }
    
    func countTotalTimesMeditated() -> Int{
        let calendar = NSCalendar.current
        let now = NSDate()
        let sevenDaysAgo = calendar.date(byAdding: .day, value: -7, to: now as Date)!
        let startDate = calendar.startOfDay(for: sevenDaysAgo)
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Session")
        let predicate = NSPredicate(format: "(date >= %@) AND (date < %@)", startDate as NSDate, now)
        fetchRequest.predicate = predicate
        do {
            let count = try moc.count(for: fetchRequest)
            print(count)
            return count
        } catch let error as NSError {
            print("DEBUG: Could not fetch total meditation count \(error)")
        }
        return 0
    }
    
    func countMeditations(meditationType: String) -> Int{
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Session")
        let predicate = NSPredicate(format: "type == %@", meditationType)
        fetchRequest.predicate = predicate
        do {
            let count = try moc.count(for: fetchRequest)
            print(count)
            return count
        } catch let error as NSError {
            print("DEBUG: Could not fetch meditation type count. \(error)")
        }
        return 0
    }
    
    func getCompletedSessions(startDate: Date, endDate: Date) -> [Session]{
        let today = Date.now
        let thisYear = Calendar.current.dateInterval(of: .year, for: today)!
        let fetchRequest: NSFetchRequest<Session> = Session.fetchRequest()
        let predicate = NSPredicate(format: "date >= %@ AND date < %@ AND completed == %@", startDate as NSDate, endDate as NSDate, NSNumber(booleanLiteral: true))
        var fetchedData: [Session] = []
        fetchRequest.predicate = predicate
        do {
            fetchedData = try moc.fetch(fetchRequest)
            return fetchedData
        } catch let error {
            print(error)
        }
        
        return [Session]()
    }
    
    func getSessions() -> [Session]{
        let fetchRequest: NSFetchRequest<Session> = Session.fetchRequest()
        var fetchedData: [Session] = []
        do{
            fetchedData = try moc.fetch(fetchRequest)
            return fetchedData
        } catch let error {
            print(error)
        }
        
        return [Session]()
    }
    
}


extension Encodable {
  var dictionary: [String: Any]? {
    guard let data = try? JSONEncoder().encode(self) else { return nil }
    return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
  }
}
