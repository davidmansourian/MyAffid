//
//  SessionsPerWeekModel.swift
//  Affid
//
//  Created by David on 2023-01-02.
//

import Foundation

struct SessionsPerWeekModel: Identifiable{
    let id = UUID()
    let day: String
    let count: Int
    let type: String
}

struct LengthForSessionTypeModel: Identifiable{
    let id = UUID()
    let type: String
    let length: Float
}
