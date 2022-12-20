//
//  NasalBreathSelectorView.swift
//  Affid
//
//  Created by David on 2022-12-20.
//

import SwiftUI

struct NasalBreathSelectorView: View {
    @StateObject var nasalBreathingVm: NasalBreathingViewModel
    @State var numberPicked = 0
    @State private var currentIndex: Int = 0
    @Namespace private var ns
    
    init(nasalBreathingVm: NasalBreathingViewModel){
        _nasalBreathingVm = StateObject(wrappedValue: nasalBreathingVm)
    }
    
    var body: some View {
        Group{
            HStack{
                Text("Breaths")
                    .foregroundColor(.white)
                    .font(.title2)
                    .padding()
                
                ScrollView(.horizontal, showsIndicators: false){
                    ScrollViewReader{ scroll in
                        
                        HStack(spacing: 20){
                            
                            ForEach(nasalBreathingVm.roundsArr, id: \.self){ rounds in
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
                                            nasalBreathingVm.totalBreaths = numberPicked*5
                                        }
                                }
                            }
                        }
                    }
                }
            }
            .padding()
        }
    }
}
