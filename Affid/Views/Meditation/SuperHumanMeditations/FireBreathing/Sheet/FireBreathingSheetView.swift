//
//  MeditationSettingsSheetView.swift
//  Affid
//
//  Created by David on 2022-11-22.
//

import SwiftUI

struct FireBreathingSheetView: View {
    @StateObject var fireBreathingVm: FireBreathingViewModel
    var closeAndDisplayFullScreen : () -> Void
    
    init(fireBreathingVm: FireBreathingViewModel, closeAndDisplayFullScreen: @escaping () -> Void) {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(ColorData.shared.appSystemYellow)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
        UISegmentedControl.appearance().backgroundColor = UIColor(ColorData.shared.thedarkerRed)
        _fireBreathingVm = StateObject(wrappedValue: fireBreathingVm)
        self.closeAndDisplayFullScreen = closeAndDisplayFullScreen
    }
    
    var body: some View {
        ZStack{
            Group{
                LinearGradient(gradient: Gradient(colors: [ColorData.shared.thedarkerRed, ColorData.shared.theRed, ColorData.shared.appSystemYellow]), startPoint: .top, endPoint: .bottom).opacity(1)
                    .cornerRadius(10)
                    .edgesIgnoringSafeArea(.all)
            }
            
            VStack{
                Image("cloudsBirdBranchSheetBG")
                    .padding(.trailing, -130)
                    .offset(y: 200)

            }
            
            VStack(alignment: .leading){
                FireBreathingMusicChoiseView(fireBreathingVm: fireBreathingVm)
                
                FireBreathingStartButtonView(fireBreathingVm: fireBreathingVm, closeAndDisplayFullScreen: closeAndDisplayFullScreen)
                    
                Spacer()
            }
        }
    }
}
