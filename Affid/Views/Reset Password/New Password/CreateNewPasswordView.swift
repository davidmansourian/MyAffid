//
//  CreateNewPasswordView.swift
//  Affid
//
//  Created by David on 2022-11-18.
//

import SwiftUI

struct CreateNewPasswordView: View {
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
                
                VStack{
                    NewPasswordPickerView()
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

struct CreateNewPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        CreateNewPasswordView()
    }
}
