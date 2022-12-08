//
//  BarModel.swift
//  BreathingCircle
//
//  Created by David on 2022-12-05.
//

import Foundation
import SwiftUI

struct Bar: Identifiable{
    let id = UUID()
    var name: String
    var month: String
    var value: Double
    var color: Color
}


struct MonthCount{
    var month: Int
    var count: Int
}
