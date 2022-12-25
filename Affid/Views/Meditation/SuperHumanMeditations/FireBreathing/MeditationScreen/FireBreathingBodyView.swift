//
//  FireBreathingBodyView.swift
//  Affid
//
//  Created by David on 2022-12-25.
//

import SwiftUI

struct FireBreathingBodyView: View {
    @StateObject var fireBreathingVm: FireBreathingViewModel
    @Environment(\.dismiss) var dismiss
    
    init(fireBreathingVm: FireBreathingViewModel){
        _fireBreathingVm = StateObject(wrappedValue: fireBreathingVm)
    }
    var body: some View {
        NavigationStack{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [ColorData.shared.thedarkerRed, ColorData.shared.theRed, ColorData.shared.appSystemYellow]), startPoint: .top, endPoint: .bottom).opacity(1)
                    .cornerRadius(10)
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                    CirclesView()
                    
                }
            }
            .toolbar{
                ToolbarItemGroup(placement: .navigationBarLeading){
                    Button {
                        dismiss()
                        Task{
                            
                        }
                    } label: {
                        Image(systemName: "x.circle")
                            .foregroundColor(.white)
                            .font(.title)
                    }
                    
                }
            }
        }
    }
}
