//
//  MeditationFinishedSheet.swift
//  BreathingCircle
//
//  Created by David on 2022-12-05.
//

import SwiftUI

struct MeditationFinishedSheet: View {
    @ObservedObject var networkManager = NetworkManager()
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack{
            if !networkManager.isConnected{
                MeditationFinishedOfflineView()
            }
            else{
                MeditationFinishedOnlineView()
            }
        }
    }
}


 struct MeditationFinishedSheet_Previews: PreviewProvider {
     static var previews: some View {
         MeditationFinishedSheet()
     }
 }

