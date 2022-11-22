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
    
    var body: some View {
        ZStack{
            Group{
                LinearGradient(gradient: Gradient(colors: [theRed, thedarkerRed, ColorData.shared.appSystemYellow]), startPoint: .top, endPoint: .bottom).opacity(1)
                    .cornerRadius(10)
                    .edgesIgnoringSafeArea(.all)
                Image("megaCloud")
                    .resizable()
                    .frame(maxHeight: 300).opacity(1)
                    .offset(y: 270)
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.5)
                Image("bird")
                    .rotationEffect(Angle(degrees: 10))
                    .offset(y: 120)
            }
            VStack(alignment: .leading){
                Picker("Breathing Style", selection: $breathingStyle) {
                    Text("Fast Breathing").tag(0)
                    Text("Slow Breathing").tag(1)
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .offset(y: 15)
                .pickerStyle(.automatic)
                .tint(.white)
                Divider()
                    .padding()
                Group{
                    Toggle("Breathing Phase Music", isOn: $breathingPhaseMusic)
                        .foregroundColor(.white)
                        .padding(.horizontal, 30)
                    Divider()
                        .padding()
                    Toggle("Retention Phase Music", isOn: $retentionPhaseMusic)
                        .foregroundColor(.white)
                        .padding(.horizontal, 30)
                    Divider()
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
                                .stroke(.white))
                        Spacer()
                    }

                }
                Spacer()
            }
            .background(
                Rectangle()
                    .foregroundColor(.white)
                    .opacity(0.1)
                    .cornerRadius(10)
                    .edgesIgnoringSafeArea(.all)
            )
            
        }
    }
}

struct MeditationSettingsSheetView_Previews: PreviewProvider {
    static var previews: some View {
        MeditationSettingsSheetView()
    }
}
