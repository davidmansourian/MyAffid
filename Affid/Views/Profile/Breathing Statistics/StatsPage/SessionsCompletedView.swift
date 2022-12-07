//
//  SessionsCompletedView.swift
//  Affid
//
//  Created by David on 2022-12-07.
//

import SwiftUI

struct SessionsCompletedView: View {
    @StateObject var statsVm: StatsViewModel
    @State private var number: Double = 0
    
    init(statsVm: StatsViewModel){
        _statsVm = StateObject(wrappedValue: statsVm)
    }
    var body: some View {
        ZStack{
            VStack{
                Color.clear
                    .frame(width: 50, height: 50)
                    .animatingOverlay(for: number)
            }
            .onAppear{
                statsVm.getTotalMeditationsCompleted()
                withAnimation{
                    number = Double(statsVm.totalCompletedMeditations)
                }
            }
        }
    }
}
