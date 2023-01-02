//
//  TotalSessionsView.swift
//  Affid
//
//  Created by David on 2023-01-02.
//

import SwiftUI

struct TotalSessionsView: View {
    @StateObject var statsVm: StatsViewModel
    
    init(statsVm: StatsViewModel){
        _statsVm = StateObject(wrappedValue: statsVm)
    }
    var body: some View {
        VStack{
            Text("al")
        }
    }
}

struct TotalSessionsView_Previews: PreviewProvider {
    static var previews: some View {
        TotalSessionsView(statsVm: StatsViewModel())
    }
}
