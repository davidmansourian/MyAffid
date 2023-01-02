//
//  NasalBreathingSession+CoreDataProperties.swift
//  Affid
//
//  Created by David on 2023-01-02.
//
//

import Foundation
import CoreData


extension NasalBreathingSession {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NasalBreathingSession> {
        return NSFetchRequest<NasalBreathingSession>(entityName: "NasalBreathingSession")
    }

    @NSManaged public var sessionContent: NSObject?
    @NSManaged public var date: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var totalRounds: Int32
    @NSManaged public var averageHoldLength: Int32
    @NSManaged public var breaths: Int32
    @NSManaged public var longestHold: Int32
    @NSManaged public var longestHoldRound: Int32
    @NSManaged public var breathsCompleted: Int32
    @NSManaged public var session: Session?

}

extension NasalBreathingSession : Identifiable {

}
