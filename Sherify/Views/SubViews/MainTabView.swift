//
//  SwiftUIView.swift
//  Sherify
//
//  Created by Omar Abou Chaer on 2025-03-08.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            AddEventView()
                .tabItem {
                    Image(systemName: "plus.circle")
                    Text("Profile")
                }
            
            EventsView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Events")
                }
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
        .accentColor(.black)
    }
}

#Preview {
    MainTabView()
}
