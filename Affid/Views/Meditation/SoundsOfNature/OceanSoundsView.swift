//
//  OceanSoundsView.swift
//  Affid
//
//  Created by David on 2022-12-07.
//

import SwiftUI

struct OceanSoundsView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack{
            ZStack{
                VStack{
                    Image("ocean")
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
                    await SoundManager.shared.playURLSound(sound: "https://audio.davidmansourian.se/oceansounds.mp3")
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

struct OceanSoundsView_Previews: PreviewProvider {
    static var previews: some View {
        OceanSoundsView()
    }
}
