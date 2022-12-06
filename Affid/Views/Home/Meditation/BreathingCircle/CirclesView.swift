//
//  CirclesView.swift
//  Affid
//
//  Created by David on 2022-12-06.
//

import SwiftUI

struct CirclesView: View {
    @State private var scale = 0.9
    @State private var innerCircleScale = 0.9
    @State private var animate = false
    var body: some View{
        ZStack{
            Circle()
                .fill(ColorData.shared.appSystemBlue.opacity(0.1))
                .frame(width: 230, height: 230)
                .scaleEffect(scale)
                .animation(.easeInOut(duration: 5).repeatForever(), value: animate)
            
            
            Circle()
                .fill(ColorData.shared.appSystemBlue.opacity(0.5))
                .frame(width: 210, height: 210)
                .scaleEffect(scale)
                .animation(.easeInOut(duration: 5).repeatForever(), value: animate)
            
            Circle()
                .fill(ColorData.shared.appSystemYellow.opacity(0.6))
                .frame(width: 200, height: 200)
                .scaleEffect(scale)
                .animation(.easeInOut(duration: 5).repeatForever(), value: scale)
            
            
            Circle()
                .fill(ColorData.shared.appSystemYellow)
                .frame(width: 185, height: 185)
                .shadow(color: .yellow, radius: 5)
                .scaleEffect(innerCircleScale)
                .animation(.easeInOut(duration: 5).repeatForever(), value: animate)
        }
        .onAppear{
            self.animate.toggle()
            self.scale = self.animate ? 1.0 : 0.9
            self.innerCircleScale = self.animate ? 1.0 : 0.9
            
        }
    }
}
