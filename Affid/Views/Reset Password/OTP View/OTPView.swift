//
//  OTPView.swift
//  Affid
//
//  Created by David on 2022-11-18.
//

import SwiftUI

struct OTPView: View {
    var body: some View {
        ZStack{
            
            ColorData.shared.backGroundColor
                .edgesIgnoringSafeArea(.all)
            
            LoginCloudsView()
                .offset(y: -220)
            VStack{
                Text("Check your email for your OTP and enter it below")
                    .foregroundColor(.white)
                    .font(.title3)
                    .bold()
                    .padding()
                
                OTPTextFieldView()
                
                Button("Continue"){
                    print("Testing OTP continue Button")
                }
                .buttonStyle(BlueButton())
                .padding()
            }
        }
    }
}

struct OTPView_Previews: PreviewProvider {
    static var previews: some View {
        OTPView()
    }
}
