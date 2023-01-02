//
//  FireBreatingCirclesView.swift
//  Affid
//
//  Created by David on 2023-01-02.
//

import SwiftUI

struct FireBreatingCirclesView: View {
    @StateObject var fireBreathingVm: FireBreathingViewModel
    
    init(fireBreathingVm: FireBreathingViewModel){
        _fireBreathingVm = StateObject(wrappedValue: fireBreathingVm)
    }
    var body: some View {
        CirclesView()
            .padding(.top, 50)
            .padding(.bottom, 50)
    }
}
