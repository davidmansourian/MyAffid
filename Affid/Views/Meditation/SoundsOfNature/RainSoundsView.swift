//
//  RainSoundsView.swift
//  Affid
//
//  Created by David on 2022-12-06.
//

import SwiftUI

struct RainSoundsView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack{
            ZStack{
                VStack{
                    Image("rain")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 800, height: 800)
                        .edgesIgnoringSafeArea(.all)
                }
                .toolbar{
                    ToolbarItemGroup(placement: .navigationBarLeading){
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "x.circle")
                                .foregroundColor(.white)
                                .font(.title)
                        }
                        
                    }
                }
            }
            .onAppear(){
                Task{
                   await SoundManager.shared.playURLSound(sound: "https://audio.davidmansourian.se/rainsounds.mp3")
                }
            }
            .onDisappear(){
                Task{
                    await SoundManager.shared.playerRemote?.pause()
                }
            
            }

        }
    }
}

struct RainSoundsView_Previews: PreviewProvider {
    static var previews: some View {
        RainSoundsView()
    }
}
