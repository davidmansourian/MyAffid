//
//  AppleButton.swift
//  Affid
//
//  Created by David on 2022-11-18.
//

import SwiftUI

// Idea taken from https://www.hackingwithswift.com/quick-start/swiftui/customizing-button-with-buttonstyle
struct AppleButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(height: 30)
            .frame(maxWidth: .infinity)
            .padding()
            .background(.black)
            .foregroundColor(.white)
            .bold()
            .cornerRadius(38)
            .scaleEffect(configuration.isPressed ? 1.1 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}
