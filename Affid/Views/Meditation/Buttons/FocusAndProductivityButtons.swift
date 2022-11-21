//
//  FocusAndProductivityButtons.swift
//  Affid
//
//  Created by David on 2022-11-21.
//

import SwiftUI

struct ReduceStressButton: ButtonStyle {
    let yellowButtonColor: Color = Color(red: 255/255, green: 207/255, blue: 134/255)
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(width: 180, height: 90)
            .padding()
            .background(yellowButtonColor)
            .foregroundColor(.white)
            .cornerRadius(38)
            .scaleEffect(configuration.isPressed ? 1.1 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

struct EightHourSleepButton: ButtonStyle {
    let purpleButtonColor: Color = Color(red: 142/255, green: 151/255, blue: 253/255)
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(width: 180, height: 90)
            .padding()
            .background(purpleButtonColor)
            .foregroundColor(.white)
            .cornerRadius(38)
            .scaleEffect(configuration.isPressed ? 1.1 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

struct GetInTheZoneButton: ButtonStyle {
    let grayButtonColor: Color = Color(red: 78/255, green: 85/255, blue: 103/255)
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(width: 180, height: 90)
            .padding()
            .background(grayButtonColor)
            .foregroundColor(.white)
            .cornerRadius(38)
            .scaleEffect(configuration.isPressed ? 1.1 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}
