//
//  NasalBreathingSheetView.swift
//  Affid
//
//  Created by David on 2022-11-23.
//

import SwiftUI

struct NasalBreathingSheetView: View {
    @StateObject var nasalBreathingVm = NasalBreathingViewModel()
    var theLighterGreen = Color(red: 118/255, green: 199/255, blue: 158/255)
    var theDarkerGreen = Color(red: 108/255, green: 178/255, blue: 142/255)
    @Namespace private var ns
    
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(ColorData.shared.appSystemYellow)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
        UISegmentedControl.appearance().backgroundColor = UIColor(theDarkerGreen)
    }
    
    var body: some View {
        ZStack{
            Group{
                LinearGradient(gradient: Gradient(colors: [theDarkerGreen, theLighterGreen, .white]), startPoint: .top, endPoint: .bottom).opacity(1)
                    .cornerRadius(10)
                    .edgesIgnoringSafeArea(.all)
            }
            
            VStack{
                Image("cloudsBirdBranchSheetBG")
                    .padding(.trailing, -130)
                    .offset(y: 200)
            }
            
            
            VStack(alignment: .leading){
               NasalMusicChoiceView(nasalBreathingVm: nasalBreathingVm)
                    
                DividerView()
                    
                NasalBreathSelectorView(nasalBreathingVm: nasalBreathingVm)
                
                NasalBreathingStartButtonView(nasalBreathingVm: nasalBreathingVm)
                
                Spacer()

            }

        }
    }
    
    
}


struct NasalBreathingSheetView_Previews: PreviewProvider {
    static var previews: some View {
        NasalBreathingSheetView()
    }
}
