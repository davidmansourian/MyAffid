//
//  ToolbarBackButtonDismiss.swift
//  Affid
//
//  Created by David on 2022-12-07.
//

import SwiftUI

struct ToolbarBackButtonDismiss: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        Button(action: { dismiss()
        }) {
            Image(systemName: "chevron.backward")
                .foregroundColor(Color.white)
                .padding(10)
                .overlay(
                    Circle()
                        .stroke(.white))
        }
    }
}

struct ToolbarBackButtonDismiss_Previews: PreviewProvider {
    static var previews: some View {
        ToolbarBackButtonDismiss()
    }
}
