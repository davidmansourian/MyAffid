//
//  NewPasswordPickerView.swift
//  Affid
//
//  Created by David on 2022-11-18.
//

import SwiftUI

struct NewPasswordPickerView: View {
    @State var password: String = ""
    @State var confirmPassword: String = ""
    var body: some View {
        VStack{
            TextField("Set Password", text: $password)
                .foregroundColor(Color.white)
                .font(.headline)
                .padding()
                .background(
                    Rectangle()
                        .fill(ColorData.shared.textFieldColor)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .cornerRadius(38)
                )
            TextField("Confirm Password", text: $confirmPassword)
                .foregroundColor(Color.white)
                .font(.headline)
                .padding()
                .background(
                    Rectangle()
                        .fill(ColorData.shared.textFieldColor)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .cornerRadius(38)
                )
                .offset(y: 10)
        }
    }
}

struct NewPasswordPickerView_Previews: PreviewProvider {
    static var previews: some View {
        NewPasswordPickerView()
    }
}
