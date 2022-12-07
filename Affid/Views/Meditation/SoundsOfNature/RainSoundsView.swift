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
                            SoundManager.shared.playerRemote?.pause()
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
                SoundManager.shared.playURLSound(sound: "gs://affid-777aa.appspot.com/noise/rainsounds.mp3")
                if SoundManager.shared.loading{
                    print("hejsan")
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
