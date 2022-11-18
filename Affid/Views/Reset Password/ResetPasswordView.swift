//
//  ResetPasswordView.swift
//  Affid
//
//  Created by David on 2022-11-18.
//

import SwiftUI

struct ResetPasswordView: View {
    var body: some View {
        ZStack{
            ColorData.shared.backGroundColor
                .edgesIgnoringSafeArea(.all)
            VStack{
                Spacer()
                Group{
                    HStack{
                        LoginCloudsView()
                    }
                    Spacer()
                        Text("Reset Password")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .bold()
                            .padding()
                    Text("Enter the email associated with your account below")
                        .foregroundColor(.gray)
                        .padding()
                        .font(.footnote)
                }
                
                HStack{
                    ResetPasswordTextField()
                }
                .padding()
                
                HStack{
                    Button("Reset"){
                        print("Testing reset button")
                    }
                    .buttonStyle(BlueButton())
                }
                .padding()
                Spacer()
                Spacer()
                Spacer()
            }
        }
    }
}

struct ResetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordView()
    }
}
