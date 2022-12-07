//
//  MeditationFinishedOnlineView.swift
//  Affid
//
//  Created by David on 2022-12-07.
//

import SwiftUI

struct MeditationFinishedOnlineView: View {
    @StateObject var quotesVm = QuotesViewModel()
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack{
            ColorData.shared.backGroundColor
                .edgesIgnoringSafeArea(.all)
            VStack{
                Spacer()
                
                VStack(alignment: .leading){
                    
                    Text("You have completed \(Int(quotesVm.totalCompletedMeditations ?? 99)) meditations this week. That's fantastic and you are doing great!")
                        .foregroundColor(.white)
                        .font(.callout)
                        .fontWeight(.light)
                        .padding(.horizontal, 25)
                }
                
                Spacer()
                
                VStack(alignment: .leading){
                    
                    Text(quotesVm.randomQuote?.text ?? "Error")
                        .foregroundColor(.white)
                        .font(.callout)
                        .fontWeight(.thin)
                        .padding(.horizontal, 25)
                    
                    Text("- \(quotesVm.randomQuote?.author ?? "Author")")
                        .foregroundColor(.white)
                        .font(.callout)
                        .fontWeight(.ultraLight)
                        .padding(.top, 4)
                        .padding(.horizontal, 25)
                }

                Spacer()
                Spacer()

                Image("birdOnBranch")
                    .offset(x: 80)
            }
        }
        .onAppear(){
            quotesVm.getTotalMeditationsCompleted()
            quotesVm.getQuote()
            SoundManager.shared.playSound(sound: .softgong)
        }
    }
}

