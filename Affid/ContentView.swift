//
//  ContentView.swift
//  Affid
//
//  Created by David on 2022-11-18.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        
        Group{
            if viewModel.userSession == nil {
                GetStartedView()
            }
            else{
                // user logged in
                MainTabView()
            }
        }
            
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}