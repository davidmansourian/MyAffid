//
//  SquareCheckmarkToggleView.swift
//  Affid
//
//  Created by David on 2022-11-23.
//

import SwiftUI

struct SquareCheckmarkToggleView: ToggleStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        return HStack {
            configuration.label
            Spacer()
            Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(configuration.isOn ? .white : .gray)
                .onTapGesture {
                    configuration.isOn.toggle()
                }
        }
        
    }
}
