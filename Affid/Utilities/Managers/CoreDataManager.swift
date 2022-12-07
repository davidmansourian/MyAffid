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
        let favorite: String = ""
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
    
    func getSessionsPerMonth() -> [Session]{
        let today = Date.now
        let thisYear = Calendar.current.dateInterval(of: .year, for: today)!
        let fetchRequest: NSFetchRequest<Session> = Session.fetchRequest()
        let predicate = NSPredicate(format: "date >= %@ AND date < %@ AND completed == %@", thisYear.start as NSDate, thisYear.end as NSDate, NSNumber(booleanLiteral: true))
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
    
    
    
}
