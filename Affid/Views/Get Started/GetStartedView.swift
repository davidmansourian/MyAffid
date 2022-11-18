//
//  GetStartedView.swift
//  Affid
//
//  Created by David on 2022-11-18.
//

import SwiftUI

struct GetStartedView: View {
    var body: some View {
        NavigationStack{
            ZStack{
                ColorData.shared.backGroundColor
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    GetStartedCloudsView()
                    Spacer()
                    Spacer()
                    Spacer()
                    VStack{
                        Text("Get Started")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                        Text("Dive deeper into yourself and experience calmness ")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .offset(y: 10)
                        
                    }
                    
                    VStack{
                        NavigationLink(
                            destination: LoginView(),
                            label:{ Text("LOG IN")
                        })
                        .buttonStyle(BlueButton())
                        Button("SIGN UP"){
                            print("Button Test")
                        }
                        .offset(y: 10)
                        .buttonStyle(BlueButton())
                    }
                    .padding()
                    Spacer()
                }
                
            }
        }
    }
}

struct GetStartedView_Previews: PreviewProvider {
    static var previews: some View {
        GetStartedView()
    }
}
