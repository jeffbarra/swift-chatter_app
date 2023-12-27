//
//  ChatterApp.swift
//  Chatter
//
//  Created by Jeff Barra on 12/23/23.
//

import SwiftUI
import Firebase

@main
struct ChatterApp: App {
    
    // Initialize Firebase
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
