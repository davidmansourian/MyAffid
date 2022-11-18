//
//  OTPTextFieldView.swift
//  Affid
//
//  Created by David on 2022-11-18.
//

import SwiftUI

struct OTPTextFieldView: View {
    @State var first: String = ""
    @State var second: String = ""
    @State var third: String = ""
    @State var fourth: String = ""
    @State var fifth: String = ""
    var body: some View {
        HStack(spacing: 0){
            TextField("", text: $first)
                .foregroundColor(Color.white)
                .font(.headline)
                .padding()
                .background(
                    Rectangle()
                        .fill(ColorData.shared.textFieldColor)
                        .frame(width: 60, height: 60)
                        .cornerRadius(15)
                        .shadow(radius: 3)
                )
            TextField("", text: $second)
                .foregroundColor(Color.white)
                .font(.headline)
                .padding()
                .background(
                    Rectangle()
                        .fill(ColorData.shared.textFieldColor)
                        .frame(width: 60, height: 60)
                        .cornerRadius(15)
                        .shadow(radius: 3)
                )
            TextField("", text: $third)
                .foregroundColor(Color.white)
                .font(.headline)
                .padding()
                .background(
                    Rectangle()
                        .fill(ColorData.shared.textFieldColor)
                        .frame(width: 60, height: 60)
                        .cornerRadius(15)
                        .shadow(radius: 3)
                )
            TextField("", text: $fourth)
                .foregroundColor(Color.white)
                .font(.headline)
                .padding()
                .background(
                    Rectangle()
                        .fill(ColorData.shared.textFieldColor)
                        .frame(width: 60, height: 60)
                        .cornerRadius(15)
                        .shadow(radius: 3)
                )
            TextField("", text: $fifth)
                .foregroundColor(Color.white)
                .font(.headline)
                .padding()
                .background(
                    Rectangle()
                        .fill(ColorData.shared.textFieldColor)
                        .frame(width: 60, height: 60)
                        .cornerRadius(15)
                        .shadow(radius: 3)
                )
            
        }
        .padding()
    }}

struct OTPTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        OTPTextFieldView()
    }
}
