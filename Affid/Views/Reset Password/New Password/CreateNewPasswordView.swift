//
//  CreateNewPasswordView.swift
//  Affid
//
//  Created by David on 2022-11-18.
//

import SwiftUI

struct CreateNewPasswordView: View {
    @State var newPasssord: String = ""
    @State var repeatNewPassword: String = ""
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
                    Text("Set your new password below")
                        .foregroundColor(.white)
                        .padding()
                        .font(.title2)
                }
                
                VStack(spacing: -10){
                    CustomTextField(placeHolderText: "New Password", text: $newPasssord)
                    CustomTextField(placeHolderText: "Repeat New Password", text: $repeatNewPassword)
                }

                
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
        .navigationBarBackButtonHidden(true)
    }
}

struct CreateNewPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        CreateNewPasswordView()
    }
}
