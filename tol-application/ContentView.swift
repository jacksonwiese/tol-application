//
//  ContentView.swift
//  tol-application
//
//  Created by Jackson Wiese on 4/13/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            CalendarView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Calendar")
                }
            JournalView()
                .tabItem {
                    Image(systemName: "music.mic")
                    Text("Journal")
                }
            SettingsView()
                .tabItem{
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }//end of TabView
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
