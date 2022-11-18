//
//  GetStartedCloudsView.swift
//  Affid
//
//  Created by David on 2022-11-18.
//

import SwiftUI

struct GetStartedCloudsView: View {
    var body: some View {
        ZStack{
            HStack{
                Image("clouds")
                    .offset(x: -22, y: 50)
                Image("clouds")
                    .offset(x: 50, y: -55)
                Image("clouds")
                    .offset(x: 10, y: 39)
                
            }
            HStack{
                Text("Affid")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .bold()
            }
            HStack{
                Image("birdOnBranch")
                    .offset(y: 120)
                
            }
        }
    }
}

struct GetStartedCloudsView_Previews: PreviewProvider {
    static var previews: some View {
        GetStartedCloudsView()
    }
}
