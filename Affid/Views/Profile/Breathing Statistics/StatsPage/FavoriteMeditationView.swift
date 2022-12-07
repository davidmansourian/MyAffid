//
//  FavoriteMeditationView.swift
//  Affid
//
//  Created by David on 2022-12-07.
//

import SwiftUI

struct FavoriteMeditationView: View {
    @StateObject var statsVm: StatsViewModel
    @State private var text: String = ""
    
    init(statsVm: StatsViewModel){
        _statsVm = StateObject(wrappedValue: statsVm)
    }
    var body: some View {
        ZStack{
            VStack{
                Text(text)
                    .foregroundColor(.white)
                    .font(.title)
                    .fontWeight(.regular)
            }
            .onAppear{
                statsVm.getFavoriteMeditation()
                withAnimation{
                    text = statsVm.favoriteMeditation
                }
            }
        }
    }
}
