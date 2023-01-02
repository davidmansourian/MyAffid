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
    
    let appSystemBlue: Color = Color(red: 13/255, green: 110/255, blue: 253/255)
    let appSystemYellow: Color = Color(red: 255/255, green: 203/255, blue: 20/255)
    
    let profileMenuColor: Color = Color(red: 32/255, green: 35/255, blue: 45/255)
    
    var theLighterGreen = Color(red: 118/255, green: 199/255, blue: 158/255)
    var theDarkerGreen = Color(red: 108/255, green: 178/255, blue: 142/255)
    
    var theRed = Color(red: 250/255, green: 110/255, blue: 90/255)
    var thedarkerRed = Color(red: 240/255, green: 93/255, blue: 72/255)
    var theOrange = Color(red: 204/255, green: 109/255, blue: 67/255)
    
    var statsBckgroundColor: Color = Color(red: 28/255, green: 28/255, blue: 28/255)
    
}
