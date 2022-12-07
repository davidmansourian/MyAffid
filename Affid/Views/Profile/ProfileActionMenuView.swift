//
//  ProfileActionMenuView.swift
//  Affid
//
//  Created by David on 2022-12-07.
//

import SwiftUI

struct ProfileActionMenuView: View {
    @StateObject var viewModel: AuthViewModel
    @State private  var pressedSignOut: Bool = false
    
    init(viewModel: AuthViewModel){
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                NavigationLink {
                    StatsView()
                } label: {
                    Image(systemName: "chart.bar.fill")
                        .foregroundColor(.gray)
                        .font(.title3)
                        .fontWeight(.light)
                    
                    Text("Statistics")
                        .foregroundColor(.white)
                        .font(.title3)
                        .fontWeight(.light)
                }
            }
            .padding()
            Divider()
                .font(.system(size: 100))
                .foregroundColor(.white)
            HStack{
                Button {
                    pressedSignOut = true
                } label: {
                    Image(systemName: "figure.wave")
                        .foregroundColor(.gray)
                        .font(.title3)
                        .fontWeight(.light)
                    Text("Sign out")
                        .foregroundColor(.white)
                        .font(.title3)
                        .fontWeight(.light)
                    
                }
                .alert("Sign Out?", isPresented: $pressedSignOut) {
                    Button("No", role: .cancel) {
                        pressedSignOut = false
                    }
                    Button("Yes"){
                        pressedSignOut = false
                        viewModel.signOut()
                    }
                }
            }
            .padding()
        }
        .frame(height: 140)
        .frame(maxWidth: .infinity)
        .background(ColorData.shared.profileMenuColor)
        .cornerRadius(32)
        .padding()
    }
}
