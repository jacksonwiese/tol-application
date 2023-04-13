//
//  tol_applicationApp.swift
//  tol-application
//
//  Created by Jackson Wiese on 4/13/23.
//

import SwiftUI
import Firebase

@main
struct tol_application: App {
    
    //init
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
