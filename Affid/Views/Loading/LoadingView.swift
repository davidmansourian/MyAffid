//
//  LoadingView.swift
//  Affid
//
//  Created by David on 2022-11-22.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack{
            ColorData.shared.backGroundColor
                .edgesIgnoringSafeArea(.all)
            VStack{
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .yellow))
                    .scaleEffect(2)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}
