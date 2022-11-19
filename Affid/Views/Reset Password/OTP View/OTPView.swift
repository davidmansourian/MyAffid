//
//  OTPView.swift
//  Affid
//
//  Created by David on 2022-11-18.
//

import SwiftUI

struct OTPView: View {
    @State var firstDigit: String = ""
    @State var secondDigit: String = ""
    @State var thirdDigit: String = ""
    @State var fourthDigit: String = ""
    @State var fifthDigit: String = ""
    
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
                
                HStack{
                    OTPTextField(placeHolderText: "", text: $firstDigit)
                    OTPTextField(placeHolderText: "", text: $secondDigit)
                    OTPTextField(placeHolderText: "", text: $thirdDigit)
                    OTPTextField(placeHolderText: "", text: $fourthDigit)
                    OTPTextField(placeHolderText: "", text: $fifthDigit)
                }
                .padding()
                
                NavigationLink(
                    destination: CreateNewPasswordView(),
                    label:{ Text("Continue")
                    })
                .buttonStyle(BlueButton())
                .padding()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct OTPView_Previews: PreviewProvider {
    static var previews: some View {
        OTPView()
    }
}
