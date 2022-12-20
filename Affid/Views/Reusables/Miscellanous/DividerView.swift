//
//  DividerView.swift
//  Affid
//
//  Created by David on 2022-12-20.
//

import SwiftUI

struct DividerView: View {
    var body: some View {
        Divider()
            .overlay(.white)
            .padding()
    }
}

struct DividerView_Previews: PreviewProvider {
    static var previews: some View {
        DividerView()
    }
}
