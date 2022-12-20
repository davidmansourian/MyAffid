//
//  SoundsOfNatureView.swift
//  Affid
//
//  Created by David on 2022-12-20.
//

import SwiftUI

struct SoundsOfNatureView: View {
    @State var showingRainSoundsView = false
    @State var showingOceanSoundsView = false
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 20){
                Button {
                    showingRainSoundsView.toggle()
                } label: {
                    Image("rainSoundsButton")
                }
                .padding(.leading, 20)
                .fullScreenCover(isPresented: $showingRainSoundsView, onDismiss: {
                    showingRainSoundsView = false
                }) {
                    RainSoundsView()
                }
                
                Button {
                    showingOceanSoundsView.toggle()
                } label: {
                    Image("oceanSoundsButton")
                }
                .fullScreenCover(isPresented: $showingOceanSoundsView, onDismiss: {
                    showingOceanSoundsView = false
                }) {
                    OceanSoundsView()
                }
                
            }
        }
    }
}

struct SoundsOfNatureView_Previews: PreviewProvider {
    static var previews: some View {
        SoundsOfNatureView()
    }
}
