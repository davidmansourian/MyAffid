//
//  GetStartedView.swift
//  Affid
//
//  Created by David on 2022-11-18.
//

import SwiftUI

struct GetStartedView: View {
    var body: some View {
        ZStack{
            ColorData().backGroundColor
                .edgesIgnoringSafeArea(.all)
            VStack{
                ZStack{
                    HStack{
                        Image("clouds")
                            .offset(x: -22, y: 50)
                        Image("clouds")
                            .offset(x: 50, y: -55)
                        Image("clouds")
                            .offset(x: 10, y: 39)
                        
                    }
                    HStack{
                        Text("Affid")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .bold()
                    }
                    HStack{
                        Image("birdonbranch")
                            .offset(y: 120)
                        
                    }
                }
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
                    Button("LOG IN"){
                        print("Button Test")
                    }
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

struct GetStartedView_Previews: PreviewProvider {
    static var previews: some View {
        GetStartedView()
    }
}
