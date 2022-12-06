//
//  BarTestView.swift
//  BreathingCircle
//
//  Created by David on 2022-12-05.
//

import SwiftUI

struct BarView: View {
    @StateObject var barChartVm = BarChartViewModel()
    
    var body: some View {
        VStack{
            HStack(){
                    VStack{
                        ZStack{
                            Rectangle()
                                .foregroundColor(barChartVm.yearlyChart.last?.color)
                                .frame(width: 60, height: 100, alignment: .bottom)
                                .cornerRadius(6)
                                .foregroundColor(.white)
                            
                            Text("\(Int(Float(barChartVm.yearlyChart.last!.value)))")
                                .foregroundColor(.blue)
                                .font(.headline)
                                .fontWeight(.bold)
                        }
                        Text("Sessions completed this month")
                            .foregroundColor(.white)
                            .font(.subheadline)
                            .fontWeight(.thin)
                    }
            }
            .frame(height: 80)
            .padding(.top, 20)
            
        }
        .onAppear(){
            barChartVm.loadBarChart()
        }
    }
}

struct BarView_Previews: PreviewProvider {
    static var previews: some View {
        BarView()
    }
}
