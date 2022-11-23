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
                Image("testFlames2")
                    .resizable()
                    .scaledToFill()
                    .frame(maxHeight: 100)
                    .offset(y: 400)
                    .opacity(0.1)
                    .edgesIgnoringSafeArea(.all)
                Image("birdOnBranch")
                    .padding(.trailing, -130)
            }
            
            VStack(alignment: .leading){
                Picker("Breathing Style", selection: $breathingStyle) {
                    Text("Fast Breathing").tag(0)
                    Text("Slow Breathing").tag(1)
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .offset(y: 15)
                .pickerStyle(.segmented)
                .shadow(color: Color.black.opacity(0.2), radius: 3, x: 0, y: 2)
                Divider()
                    .overlay(.white)
                    .padding()
                Group{
                    Toggle("Breathing Phase Music", isOn: $breathingPhaseMusic)
                        .font(.title3)
                        .fontWeight(.medium)
                        .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
                        .foregroundColor(breathingPhaseMusic ? ColorData.shared.appSystemYellow : .white)
                        .padding(.horizontal, 30)
                        .toggleStyle(CheckmarkToggleView())
                    Divider()
                        .overlay(.white)
                        .padding()
                    Toggle("Retention Phase Music", isOn: $retentionPhaseMusic)
                        .foregroundColor(retentionPhaseMusic ? ColorData.shared.appSystemYellow : .white)
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
            
            
        }
    }
}

struct MeditationSettingsSheetView_Previews: PreviewProvider {
    static var previews: some View {
        MeditationSettingsSheetView()
    }
}
