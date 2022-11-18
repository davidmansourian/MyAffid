//
//  LoginView.swift
//  Affid
//
//  Created by David on 2022-11-18.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        ZStack{
            ColorData.shared.backGroundColor
                .edgesIgnoringSafeArea(.all)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
