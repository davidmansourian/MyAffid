//
//  MainMeditationView.swift
//  Affid
//
//  Created by David on 2022-11-21.
//

import SwiftUI

struct MainMeditationView: View {
    var body: some View {
        ZStack{
            ColorData.shared.backGroundColor
                .edgesIgnoringSafeArea(.top)
            
            LoginCloudsView()
                .offset(y: -130)
            
            VStack(spacing: 30){
                Spacer()
                HStack(spacing: 40){
                    Text("Find your favorites")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.light)
                    
                    Image(systemName: "bookmark")
                        .foregroundColor(.white)
                        .font(.title)
                        .fontWeight(.light)
                    
                }
                
                Spacer()
                
                ScrollView(.vertical, showsIndicators: false){
                    VStack(alignment: .leading, spacing: 25){
                        
                        Group{
                            Text("Super-Human Meditations")
                                .foregroundColor(.white)
                                .fontWeight(.light)
                                .padding(.horizontal, 30)
                            
                            ScrollView(.horizontal, showsIndicators: false){
                                HStack(spacing: 20){
                                    NavigationLink {
                                        //
                                    } label: {
                                        Image("fireBreathingButton")
                                    }
                                    .padding(.leading, 20)

                                    
                                    NavigationLink {
                                        //
                                    } label: {
                                        Image("nasalBreathingButton")
                                    }

                                    
                                }
                            }
                        }
                        
                        Group{
                            Text("Focus and Productivity")
                                .foregroundColor(.white)
                                .fontWeight(.light)
                                .padding(.horizontal, 30)
                            
                            ScrollView(.horizontal, showsIndicators: false){
                                
                                
                                HStack(spacing: 20){
                                    NavigationLink {
                                        //
                                    } label: {
                                        Image("reduceStressButton")
                                    }
                                    .padding(.leading, 20)

                                    
                                    NavigationLink {
                                        //
                                    } label: {
                                        Image("eightHourSleepButton")
                                    }
                                    
                                    NavigationLink {
                                        //
                                    } label: {
                                        Image("fireBreathingButton")
                                    }
                                    
                                }
                                
                                
                            }
                        }
                        
                        Group{
                            
                            Text("Sounds of Nature")
                                .foregroundColor(.white)
                                .fontWeight(.light)
                                .padding(.horizontal, 30)
                            
                            ScrollView(.horizontal, showsIndicators: false){
                                HStack(spacing: 20){
                                    NavigationLink {
                                        //
                                    } label: {
                                        Image("rainSoundsButton")
                                    }
                                    .padding(.leading, 20)
                                    
                                    NavigationLink {
                                        //
                                    } label: {
                                        Image("oceanSoundsButton")
                                    }
                                    
                                }
                            }
                        }
                    }
                }
            }
            Spacer()
            Spacer()
            Spacer()
        }
    }
}


struct MainMeditationView_Previews: PreviewProvider {
    static var previews: some View {
        MainMeditationView()
    }
}
