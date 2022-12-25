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
    @State var showingNasalBreathingFullScreen = false
    @State var showingFireBreathingFullScreen = false
    @StateObject var nasalBreathingVm = NasalBreathingViewModel()
    @StateObject var fireBreathingVm = FireBreathingViewModel()
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
                    FireBreathingSheetView(fireBreathingVm: fireBreathingVm) {
                        showingFireBreathingSheet = false
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                            showingFireBreathingFullScreen = true
                        }
                    }
                       // .presentationDetents([.height(660)])
                }
                .fullScreenCover(isPresented: $showingFireBreathingFullScreen) {
                    FireBreathingBodyView(fireBreathingVm: fireBreathingVm)
                }
                
                Button {
                    showingNasalBreathingSheet.toggle()
                } label: {
                    Image("nasalBreathingButton")
                }
                .sheet(isPresented: $showingNasalBreathingSheet) {
                    NasalBreathingSheetView(nasalBreathingVm: nasalBreathingVm) {
                        showingNasalBreathingSheet = false
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                            showingNasalBreathingFullScreen = true
                        }
                    }
                       // .presentationDetents([.height(660)])
                }
                .fullScreenCover(isPresented: $showingNasalBreathingFullScreen){
                    NasalBreathingBodyView(nasalBreathingVm: nasalBreathingVm)
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
