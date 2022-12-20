//
//  MeditationSettingsSheetView.swift
//  Affid
//
//  Created by David on 2022-11-22.
//

import SwiftUI

struct MeditationSettingsSheetView: View {
    @State var breathingStyle = 0
    @State var breathingPhaseMusic = false
    @State var retentionPhaseMusic = false
    var theRed = Color(red: 250/255, green: 110/255, blue: 90/255)
    var thedarkerRed = Color(red: 240/255, green: 93/255, blue: 72/255)
    var theOrange = Color(red: 204/255, green: 109/255, blue: 67/255)
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(ColorData.shared.appSystemYellow)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
        UISegmentedControl.appearance().backgroundColor = UIColor(thedarkerRed)
    }
    
    var body: some View {
        ZStack{
            Group{
                LinearGradient(gradient: Gradient(colors: [thedarkerRed, theRed, ColorData.shared.appSystemYellow]), startPoint: .top, endPoint: .bottom).opacity(1)
                    .cornerRadius(10)
                    .edgesIgnoringSafeArea(.all)
            }
            
            VStack{
                Image("cloudsBirdBranchSheetBG")
                    .padding(.trailing, -130)
                    .offset(y: 200)

            }
            
            VStack(alignment: .leading){
                Spacer()
                Group{
                    Toggle("Breathing Phase Music", isOn: $breathingPhaseMusic)
                        .font(.title3)
                        .fontWeight(.medium)
                        .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
                        .foregroundColor(.white)
                        .padding(.horizontal, 30)
                        .toggleStyle(CheckmarkToggleView())
                    Divider()
                        .overlay(.white)
                        .padding()
                    Toggle("Retention Phase Music", isOn: $retentionPhaseMusic)
                        .foregroundColor(.white)
                        .font(.title3)
                        .fontWeight(.medium)
                        .shadow(color: Color.black.opacity(0.2), radius: 3, x: 0, y: 2)
                        .padding(.horizontal, 30)
                        .toggleStyle(CheckmarkToggleView())
                    Divider()
                        .overlay(.white)
                        .padding()
                    HStack{
                        Spacer()
                        Button {
                            //
                        } label: {
                            Text("Start")
                                .foregroundColor(.white)
                        }
                        .padding(20)
                        .overlay(
                            Circle()
                                .stroke(ColorData.shared.appSystemYellow, lineWidth: 3)
                                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2))
                        Spacer()
                    }
                    
                }
                Spacer()
            }
            .offset(y: -170)
            
            
            
        }
    }
}

struct MeditationSettingsSheetView_Previews: PreviewProvider {
    static var previews: some View {
        MeditationSettingsSheetView()
    }
}
