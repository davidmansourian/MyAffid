//
//  SoundsOfNatureButtons.swift
//  Affid
//
//  Created by David on 2022-11-21.
//

import SwiftUI

struct RainSoundsButton: ButtonStyle {
    let redButtonColor: Color = Color(red: 65/255, green: 152/255, blue: 244/255)
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(width: 180, height: 90)
            .padding()
            .background(redButtonColor)
            .foregroundColor(.white)
            .cornerRadius(38)
            .scaleEffect(configuration.isPressed ? 1.1 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

struct OceanSoundsButton: ButtonStyle {
    let greenButtonColor: Color = Color(red: 64/255, green: 235/255, blue: 210/255)
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
