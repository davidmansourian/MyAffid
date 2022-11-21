//
//  BreathingStatsView.swift
//  Affid
//
//  Created by David on 2022-11-21.
//

import SwiftUI

struct BreathingStatsView: View {
    @State var pickerSelectedItem = 0
    var body: some View {
        ZStack{
            VStack{
                Text("Breathing Stats")
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                
                Picker(selection: $pickerSelectedItem, label: Text("")){
                    Text("Weekly").tag(0)
                    Text("Monthly").tag(1)
                    Text("Yearly").tag(2)
                }.pickerStyle(SegmentedPickerStyle())
            }
        }
    }
}

struct BreathingStatsView_Previews: PreviewProvider {
    static var previews: some View {
        BreathingStatsView()
    }
}
