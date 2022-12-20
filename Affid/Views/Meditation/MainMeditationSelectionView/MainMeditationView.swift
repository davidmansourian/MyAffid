//
//  MainMeditationView.swift
//  Affid
//
//  Created by David on 2022-11-21.
//

import SwiftUI

struct MainMeditationView: View {
    @State var showingRainSoundsView = false
    @State var showingOceanSoundsView = false
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
                            
                            SuperHumanMeditationsView()
                        }
                        
                        Group{
                            Text("Focus and Productivity")
                                .foregroundColor(.white)
                                .fontWeight(.light)
                                .padding(.horizontal, 30)
                            
                            FocusAndProductivityView()
                        }
                        
                        Group{
                            
                            Text("Sounds of Nature")
                                .foregroundColor(.white)
                                .fontWeight(.light)
                                .padding(.horizontal, 30)
                            
                            SoundsOfNatureView()
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
