//
//  MainTabView.swift
//  Affid
//
//  Created by David on 2022-11-21.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedIndex = 0
    let tabBarAppearance = UITabBarAppearance()
    
    init(){
        tabBarAppearance.backgroundColor = ColorData.shared.tabViewBackgroundColor
        tabBarAppearance.shadowColor = ColorData.shared.tabViewShadowColor
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
    }
    var body: some View {
        TabView(selection: $selectedIndex) {
            HomeView()
                .onTapGesture {
                    self.selectedIndex = 0
                }
                .tabItem{
                    Image(systemName: "house")
                    Text("Home")
                }.tag(0)
            
            MainMeditationView()
                .onTapGesture {
                    self.selectedIndex = 1
                }
                .tabItem{
                    Image(systemName: "brain.head.profile")
                    Text("Meditation")
                }.tag(1)
            
            ProfileView()
                .onTapGesture {
                    self.selectedIndex = 2
                }
                .tabItem{
                    Image(systemName: "figure.stand")
                    Text("Profile")
                }.tag(2)
        }
        .accentColor(ColorData.shared.appSystemYellow)
        
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
