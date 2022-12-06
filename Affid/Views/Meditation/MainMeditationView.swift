//
//  MainMeditationView.swift
//  Affid
//
//  Created by David on 2022-11-21.
//

import SwiftUI

struct MainMeditationView: View {
    @State var showingSheet = false
    @State var showingFireBreathingSheet = false
    @State var showingNasalBreathingSheet = false
    var body: some View {
        ZStack{
            ColorData.shared.backGroundColor
                .edgesIgnoringSafeArea(.top)
            
           /* LoginCloudsView()
                .offset(y: -130)*/
            
            VStack(spacing: 30){
                Spacer()
                HStack(spacing: 40){
                    Text("Find your favorites")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.light)
                    
                }
                
                ScrollView(.vertical, showsIndicators: false){
                    VStack(alignment: .leading, spacing: 25){
                        
                        Group{
                            Text("Super-Human Meditations")
                                .foregroundColor(.white)
                                .fontWeight(.light)
                                .padding(.horizontal, 30)
                            
                            ScrollView(.horizontal, showsIndicators: false){
                                HStack(spacing: 20){
                                    Button {
                                        showingFireBreathingSheet.toggle()
                                    } label: {
                                        Image("fireBreathingButton")
                                    }
                                    .padding(.leading, 20)
                                    .sheet(isPresented: $showingFireBreathingSheet) {
                                        MeditationSettingsSheetView()
                                            .presentationDetents([.height(630)])
                                    }
                                    
                                    Button {
                                        showingNasalBreathingSheet.toggle()
                                    } label: {
                                        Image("nasalBreathingButton")
                                    }
                                    .sheet(isPresented: $showingNasalBreathingSheet) {
                                        NasalBreathingSheetView()
                                            .presentationDetents([.height(630)])
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
                                    Button {
                                        showingSheet.toggle()
                                    } label: {
                                        Image("reduceStressButton")
                                    }
                                    .padding(.leading, 20)
                                    .sheet(isPresented: $showingSheet) {
                                        Text("Alfred")
                                    }

                                    
                                    Button {
                                        showingSheet.toggle()
                                    } label: {
                                        Image("eightHourSleepButton")
                                    }
                                    .sheet(isPresented: $showingSheet) {
                                        Text("Alfred")
                                    }
                                    
                                    Button {
                                        showingSheet.toggle()
                                    } label: {
                                        Image("fireBreathingButton")
                                    }
                                    .sheet(isPresented: $showingSheet) {
                                        Text("Alfred")
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
                                    Button {
                                        showingSheet.toggle()
                                    } label: {
                                        Image("rainSoundsButton")
                                    }
                                    .padding(.leading, 20)
                                    .sheet(isPresented: $showingSheet) {
                                        Text("Alfred")
                                    }
                                    
                                    Button {
                                        showingSheet.toggle()
                                    } label: {
                                        Image("oceanSoundsButton")
                                    }
                                    .sheet(isPresented: $showingSheet) {
                                        MeditationSettingsSheetView()
                                            .presentationDetents([.fraction((0.2)), .medium])
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
