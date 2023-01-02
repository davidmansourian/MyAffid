//
//  Session+CoreDataProperties.swift
//  Affid
//
//  Created by David on 2023-01-02.
//
//

import Foundation
import CoreData


extension Session {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Session> {
        return NSFetchRequest<Session>(entityName: "Session")
    }

    @NSManaged public var completed: Bool
    @NSManaged public var date: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var length: Float
    @NSManaged public var type: String?
    @NSManaged public var nasalSession: NasalBreathingSession?
    @NSManaged public var fireSession: FireBreathingSession?

}

extension Session : Identifiable {

}
