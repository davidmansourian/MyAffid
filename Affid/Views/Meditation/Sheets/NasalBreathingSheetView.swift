//
//  NasalBreathingSheetView.swift
//  Affid
//
//  Created by David on 2022-11-23.
//

import SwiftUI

struct NasalBreathingSheetView: View {
    @StateObject var breathCountViewModel = BreathCountViewModel()
    @State var numberPicked = 0
    @State var breathingStyle = 0
    @State var breathingPhaseMusic = false
    @State var retentionPhaseMusic = false
    @State private var currentIndex: Int = 0
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
                
                Group{
                    Picker("Breathing Style", selection: $breathingStyle) {
                        Text("Fast Breathing").tag(0)
                        Text("Slow Breathing").tag(1)
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .offset(y: 15)
                    .pickerStyle(.segmented)
                    .shadow(color: Color.black.opacity(0.2), radius: 3, x: 0, y: 2)
                }
                Divider()
                    .overlay(.white)
                    .padding()
                
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
                        .foregroundColor(retentionPhaseMusic ? .white : .white)
                        .font(.title3)
                        .fontWeight(.medium)
                        .shadow(color: Color.black.opacity(0.2), radius: 3, x: 0, y: 2)
                        .padding(.horizontal, 30)
                        .toggleStyle(CheckmarkToggleView())
                }
                    
                    Divider()
                        .overlay(.white)
                        .padding()
                    
                Group{
                    HStack{
                        Text("Rounds")
                            .foregroundColor(.white)
                            .font(.title2)
                            .padding()
                        
                        ScrollView(.horizontal, showsIndicators: false){
                            ScrollViewReader{ scroll in
                                
                                HStack(spacing: 20){
                                    
                                    ForEach(breathCountViewModel.roundsArr){ rounds in
                                        if rounds.breathIndex == currentIndex{
                                            ZStack{
                                                Text("\(rounds.count)")
                                                    .foregroundColor(.white)
                                                    .font(.title2)
                                                    .padding()
                                                VStack() {
                                                    Circle()
                                                        .stroke(ColorData.shared.appSystemYellow, lineWidth: 3)
                                                        .frame(width: 40, height: 40)
                                                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                                                }.matchedGeometryEffect(id: "animation", in: ns)
                                            }
                                        }else {
                                            Text("\(rounds.count)")
                                                .foregroundColor(.white)
                                                .font(.title2)
                                                .padding()
                                                .onTapGesture {
                                                    withAnimation {
                                                        currentIndex = rounds.breathIndex
                                                        numberPicked = currentIndex
                                                        scroll.scrollTo(rounds.breathIndex)
                                                    }
                                                }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .padding()
                }
                
                Group{
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
                    .padding(.top, 50)
                }
                
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
