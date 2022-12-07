//
//  AnimatableNumberModifier.swift
//  Affid
//
//  Created by David on 2022-12-07.
//

import Foundation
import SwiftUI


// https://stefanblos.com/posts/animating-number-changes/
struct AnimatableNumberModifier: AnimatableModifier {
    var number: Double
    
    var animatableData: Double {
        get { number }
        set { number = newValue }
    }
    
    func body(content: Content) -> some View {
        content
            .overlay(
                Text("\(Int(number))")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.medium)
            )
    }
}
