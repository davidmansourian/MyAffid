//
//  SuperHumanMeditationButtons.swift
//  Affid
//
//  Created by David on 2022-11-21.
//

import SwiftUI



struct FireBreathingButton: ButtonStyle {
    let redButtonColor: Color = Color(red: 204/255, green: 105/255, blue: 30/255)
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(width: 180, height: 90)
            .padding()
            .background(.red)
            .foregroundColor(.white)
            .cornerRadius(38)
            .scaleEffect(configuration.isPressed ? 1.1 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

struct NasalBreathingButton: ButtonStyle {
    let greenButtonColor: Color = Color(red: 110/255, green: 112/255, blue: 10/255)
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(width: 180, height: 90)
            .padding()
            .background(greenButtonColor)
            .foregroundColor(.white)
            .cornerRadius(38)
            .scaleEffect(configuration.isPressed ? 1.1 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

