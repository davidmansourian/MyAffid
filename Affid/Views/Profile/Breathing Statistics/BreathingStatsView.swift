//
//  BreathingStatsView.swift
//  Affid
//
//  Created by David on 2022-11-21.
//

import SwiftUI

struct BreathingStatsView: View {
    @State var animate = false
    var body: some View {
        ZStack{
            VStack(alignment: .leading, spacing: -10){
                Text("Breathing Stats")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.horizontal, 70)
                
                HStack(spacing: 20){
                    theChart
                    theChart
                    theChart
                    theChart
                    theChart
                    theChart
                    theChart
                }
                .padding(.horizontal, 70)
                .padding(.top, 30)
            }
        }
    }
}

struct BreathingStatsView_Previews: PreviewProvider {
    static var previews: some View {
        BreathingStatsView()
    }
}

extension BreathingStatsView{
    var theChart: some View{
        VStack {
            ZStack(alignment: .bottom){
                Capsule().frame(width: 20, height: 200)
                    .foregroundColor(ColorData.shared.appSystemBlue)
                Capsule().frame(width: 20, height: 100)
                    .foregroundColor(ColorData.shared.appSystemYellow)
            }
            Text("M")
                .foregroundColor(.white)
                .padding(.top, 8)
        }
    }
}
