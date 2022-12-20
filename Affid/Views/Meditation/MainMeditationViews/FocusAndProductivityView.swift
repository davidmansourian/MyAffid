//
//  FocusAndProductivityView.swift
//  Affid
//
//  Created by David on 2022-12-20.
//

import SwiftUI

struct FocusAndProductivityView: View {
    @State var showingSheet = false
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            
            HStack(spacing: 20){
                Button {
                    showingSheet.toggle()
                } label: {
                    Image("reduceStressButton")
                }
                .padding(.leading, 20)
                .sheet(isPresented: $showingSheet) {
                    Text("Alfred")
                }

                
                Button {
                    showingSheet.toggle()
                } label: {
                    Image("eightHourSleepButton")
                }
                .sheet(isPresented: $showingSheet) {
                    Text("Alfred")
                }
                
                Button {
                    showingSheet.toggle()
                } label: {
                    Image("fireBreathingButton")
                }
                .sheet(isPresented: $showingSheet) {
                    Text("Alfred")
                }
                
            }
        }
    }
}

struct FocusAndProductivityView_Previews: PreviewProvider {
    static var previews: some View {
        FocusAndProductivityView()
    }
}
