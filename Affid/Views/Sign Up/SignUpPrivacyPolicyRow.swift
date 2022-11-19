//
//  SignUpPrivacyPolicyRow.swift
//  Affid
//
//  Created by David on 2022-11-18.
//

import SwiftUI

struct SignUpPrivacyPolicyRow: View {
    var body: some View {
        HStack(spacing: 100){
            Text("I have read the Privacy Policy")
                .foregroundColor(Color.gray)
            Image(systemName: "square")
                .foregroundColor(Color.gray) // Should toggle white when filled
        }
    }
}

struct SignUpPrivacyPolicyRow_Previews: PreviewProvider {
    static var previews: some View {
        SignUpPrivacyPolicyRow()
    }
}
