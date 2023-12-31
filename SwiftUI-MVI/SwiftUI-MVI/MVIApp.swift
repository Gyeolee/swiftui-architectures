//
//  MVIApp.swift
//  SwiftUI-MVI
//
//  Created by Hangyeol on 11/10/23.
//

import SwiftUI

@main
struct MVIApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    @StateObject var navigator: Navigator = .init()
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(navigator)
        }
    }
}
