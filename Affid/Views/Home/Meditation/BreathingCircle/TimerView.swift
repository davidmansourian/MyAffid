//
//  TimerView.swift
//  Affid
//
//  Created by David on 2022-12-06.
//

import SwiftUI

struct TimerView: View {
    @StateObject var timerVm: TimerViewModel
    
    init(timerVm: TimerViewModel){
        _timerVm = StateObject(wrappedValue: timerVm)
    }
    
    var body: some View{
        VStack{
            if !timerVm.isActive{
                Picker("", selection: $timerVm.picked){
                    ForEach(timerVm.pickerArr){ selection in
                        Text("\(selection.number) \(selection.text)")
                            .foregroundColor(ColorData.shared.appSystemBlue)
                            .font(.title)
                            .fontWeight(.light)
                    }
                }
                .pickerStyle(.wheel)
                .accentColor(.black)
                .offset(y: 25)
            }
            
            else{
                Text("\(timerVm.time)")
                    .foregroundColor(ColorData.shared.appSystemBlue)
                    .font(.largeTitle)
                    .fontWeight(.light)
                    .padding()
                    .frame(width: 150)
                    .offset(y: 30)
            }
        }
        .frame(width: 150, height: 100)
        
        TimerButtonView(timerVm: timerVm)
     }
}
