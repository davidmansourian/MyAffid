//
//  CheckmarkToggleView.swift
//  Affid
//
//  Created by David on 2022-11-23.
//

import SwiftUI



// struct below taken from https://www.appcoda.com/swiftui-toggle-style/

struct CheckmarkToggleView: ToggleStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        return HStack {
            configuration.label
            Spacer()
            Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(configuration.isOn ? ColorData.shared.appSystemYellow : .white)
                .font(.system(size: 20, weight: .bold, design: .default))
                .onTapGesture {
                    configuration.isOn.toggle()
                }
        }
        
    }
}
