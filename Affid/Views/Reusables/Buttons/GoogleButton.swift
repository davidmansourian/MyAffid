//
//  GoogleButton.swift
//  Affid
//
//  Created by David on 2022-11-18.
//

import SwiftUI

// Idea taken from https://www.hackingwithswift.com/quick-start/swiftui/customizing-button-with-buttonstyle
struct GoogleButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(height: 25)
            .frame(maxWidth: .infinity)
            .padding()
            .background(.white)
            .foregroundColor(Color.black.opacity(0.54))
            .bold()
            .cornerRadius(38)
            .scaleEffect(configuration.isPressed ? 1.1 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}
