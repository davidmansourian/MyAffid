//
//  FireBreathingSession+CoreDataProperties.swift
//  Affid
//
//  Created by David on 2023-01-02.
//
//

import Foundation
import CoreData


extension FireBreathingSession {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FireBreathingSession> {
        return NSFetchRequest<FireBreathingSession>(entityName: "FireBreathingSession")
    }

    @NSManaged public var sessionContent: NSObject?
    @NSManaged public var date: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var totalRounds: Int32
    @NSManaged public var averageHoldLength: Int32
    @NSManaged public var longestHoldRound: Int32
    @NSManaged public var longestHold: Int32
    @NSManaged public var session: Session?

}

extension FireBreathingSession : Identifiable {

}
