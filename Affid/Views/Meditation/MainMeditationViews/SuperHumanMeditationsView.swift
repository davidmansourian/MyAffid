//
//  SuperHumanMeditationsView.swift
//  Affid
//
//  Created by David on 2022-12-20.
//

import SwiftUI

struct SuperHumanMeditationsView: View {
    @State var showingFireBreathingSheet = false
    @State var showingNasalBreathingSheet = false
    var body: some View {
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
                       // .presentationDetents([.height(660)])
                }
                
                Button {
                    showingNasalBreathingSheet.toggle()
                } label: {
                    Image("nasalBreathingButton")
                }
                .sheet(isPresented: $showingNasalBreathingSheet) {
                    NasalBreathingSheetView()
                       // .presentationDetents([.height(660)])
                }

                
            }
        }
    }
}

struct SuperHumanMeditationsView_Previews: PreviewProvider {
    static var previews: some View {
        SuperHumanMeditationsView()
    }
}
