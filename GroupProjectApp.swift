//
//  GroupProjectApp.swift
//  GroupProject
//
//  Created by Aaron Anthony on 7/23/23.
//

import SwiftUI
import FirebaseCore

@main
struct GroupProjectApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            LoginViewer()
        }
    }
}
