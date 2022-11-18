//
//  LoginCloudsView.swift
//  Affid
//
//  Created by David on 2022-11-18.
//

import SwiftUI

struct LoginCloudsView: View {
    var body: some View {
            HStack{
                Image("opacityCloud")
                    .offset(x: -22, y: 50)
                Image("opacityCloud")
                    .offset(x: 50, y: -55)
                Image("opacityCloud")
                    .offset(x: 10, y: 39)
                Image("smallBird")
                    .offset(x: -100)
                
            }
    }
}

struct LoginCloudsView_Previews: PreviewProvider {
    static var previews: some View {
        LoginCloudsView()
    }
}
