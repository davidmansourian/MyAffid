//
//  BlueButton.swift
//  Affid
//
//  Created by David on 2022-11-18.
//

import SwiftUI

struct BlueButton: ButtonStyle {
    let blueButtonColor: Color = Color(red: 13/255, green: 110/255, blue: 253/255)
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(height: 30)
            .frame(maxWidth: .infinity)
            .padding()
            .background(blueButtonColor)
            .foregroundColor(.white)
            .cornerRadius(38)
            .scaleEffect(configuration.isPressed ? 1.05 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}


