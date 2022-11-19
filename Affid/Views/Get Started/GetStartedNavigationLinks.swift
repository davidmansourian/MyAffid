//
//  GetStartedNavigationLinks.swift
//  Affid
//
//  Created by David on 2022-11-18.
//

import SwiftUI

struct GetStartedNavigationLinks: View {
    var body: some View {
        VStack(spacing: 30){
            NavigationLink(
                destination: LoginView(),
                label:{ Text("LOGIN")
                })
            .buttonStyle(BlueButton())
            NavigationLink(
                destination: SignUpView(),
                label:{ Text("SIGN UP")
                })
            .buttonStyle(BlueButton())
        }
        .padding()
    }
}

struct GetStartedNavigationLinks_Previews: PreviewProvider {
    static var previews: some View {
        GetStartedNavigationLinks()
    }
}
