//
//  MeditationFinishedOfflineView.swift
//  Affid
//
//  Created by David on 2022-12-07.
//

import SwiftUI

struct MeditationFinishedOfflineView: View {
    var body: some View {
        ZStack{
            ColorData.shared.backGroundColor
                .edgesIgnoringSafeArea(.all)
            VStack{
                Spacer()
                
                VStack(alignment: .leading){
                    
                    Text("Great job!")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.thin)
                        .padding(.horizontal, 25)
                }
                Spacer()

                Image("birdOnBranch")
                    .offset(x: 80)
            }
        }
        .onAppear{
            SoundManager.shared.playSound(sound: .softgong)
        }
    }
}

struct MeditationFinishedOfflineView_Previews: PreviewProvider {
    static var previews: some View {
        MeditationFinishedOfflineView()
    }
}
