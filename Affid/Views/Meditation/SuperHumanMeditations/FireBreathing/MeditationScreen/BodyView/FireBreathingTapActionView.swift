//
//  FireBreathingTapActionView.swift
//  Affid
//
//  Created by David on 2023-01-02.
//

import SwiftUI

struct FireBreathingTapActionView: View {
    @StateObject var fireBreathingVm: FireBreathingViewModel
    
    init(fireBreathingVm: FireBreathingViewModel){
        _fireBreathingVm = StateObject(wrappedValue: fireBreathingVm)
    }
    var body: some View {
        Text("Double tap to rest")
            .foregroundColor(.white)
            .font(.title)
            .fontWeight(.light)
            .padding()
    }
}
