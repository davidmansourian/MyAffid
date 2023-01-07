//
//  BarTestView.swift
//  BreathingCircle
//
//  Created by David on 2022-12-05.
//

import SwiftUI

struct BarView: View {
    @StateObject var barChartVm = BarChartViewModel()
    @State private var barAppearing: Bool = false
    
    var body: some View {
        VStack{
            HStack(){
                VStack{
                    ZStack{
                        Rectangle()
                            .foregroundColor(barChartVm.yearlyChart.last?.color)
                            .frame(width: 60, height: barAppearing ? 100 : 0, alignment: .bottom)
                            .cornerRadius(6)
                            .foregroundColor(.white)
                            .onAppear(){
                                withAnimation(.easeOut(duration: 1)){
                                    barAppearing = true
                                }
                            }
                            .onDisappear(){
                                barAppearing = false
                            }
                        
                        Text("\(Int(Float(barChartVm.yearlyChart[0].value)))") // value here needs to correlate to the current month
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

