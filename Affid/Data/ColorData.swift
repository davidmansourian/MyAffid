//
//  ColorData.swift
//  Affid
//
//  Created by David on 2022-11-18.
//

import Foundation
import SwiftUI

class ColorData: ObservableObject{
    static var shared = ColorData()
   var backGroundColor: Color = Color(red: 22/255, green: 24/255, blue: 31/255)
}
