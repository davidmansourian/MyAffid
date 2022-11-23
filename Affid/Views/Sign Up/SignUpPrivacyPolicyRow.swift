//
//  SignUpPrivacyPolicyRow.swift
//  Affid
//
//  Created by David on 2022-11-18.
//

import SwiftUI

struct SignUpPrivacyPolicyRow: View {
    @State var acceptedPolicy = false
    var body: some View {
        HStack{
            Toggle("I have read the Privacy Policy", isOn: $acceptedPolicy)
                .foregroundColor(acceptedPolicy ? .white : .gray)
                .padding()
                .toggleStyle(SquareCheckmarkToggleView())
        }
    }
}

struct SignUpPrivacyPolicyRow_Previews: PreviewProvider {
    static var previews: some View {
        SignUpPrivacyPolicyRow()
    }
}
