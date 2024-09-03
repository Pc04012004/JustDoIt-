//
//  JustDoIt_App.swift
//  JustDoIt✅
//
//  Created by Prasad Chede on 20/06/24.
//
import FirebaseCore
import SwiftUI

@main
struct JustDoIt_App: App {
    
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
