import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            NavigationStack {
                HomeView()
            }
            .tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }

            NavigationStack {
                AddEventView()
            }
            .tabItem {
                Image(systemName: "plus.circle")
                Text("Add Event")
            }

            NavigationStack {
                EventsView()
            }
            .tabItem {
                Image(systemName: "list.bullet")
                Text("Events")
            }

            NavigationStack {
                SettingsView()
            }
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
