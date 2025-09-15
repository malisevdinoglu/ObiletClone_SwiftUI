//
//  ObiletCloneApp.swift
//  ObiletClone
//
//  Created by Mehmet Ali Sevdinoğlu on 15.09.2025.
//

import SwiftUI

@main
struct ObiletCloneApp: App {
    
    init() {
       
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(Color.brandRed)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
