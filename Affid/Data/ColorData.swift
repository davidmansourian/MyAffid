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
    var textFieldColor: Color = Color(red: 63/255, green:  65/255, blue: 78/255)
    var tabViewShadowColor: UIColor = UIColor(Color(red: 84/255, green: 87/255, blue: 92/255).opacity(0.5))
    var tabViewBackgroundColor: UIColor = UIColor(Color(red: 22/255, green: 24/255, blue: 31/255))
    
    
}
