//
//  SignUpPrivacyPolicyRow.swift
//  Affid
//
//  Created by David on 2022-11-18.
//

import SwiftUI

struct SignUpPrivacyPolicyRow: View {
    var body: some View {
        HStack{
            Text("I have read the Privacy Policy")
                .offset(x: -40)
                .foregroundColor(Color.gray)
            Image(systemName: "square")
                .offset(x: 40)
                .foregroundColor(Color.gray) // Should toggle white when filled
        }
    }
}

struct SignUpPrivacyPolicyRow_Previews: PreviewProvider {
    static var previews: some View {
        SignUpPrivacyPolicyRow()
    }
}
