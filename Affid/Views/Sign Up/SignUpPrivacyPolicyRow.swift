//
//  SignUpPrivacyPolicyRow.swift
//  Affid
//
//  Created by David on 2022-11-18.
//

import SwiftUI

struct SignUpPrivacyPolicyRow: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        HStack{
            Toggle("I have read the Privacy Policy", isOn: $viewModel.acceptedPrivacyPolicy)
                .foregroundColor(viewModel.acceptedPrivacyPolicy ? .white : .gray)
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
