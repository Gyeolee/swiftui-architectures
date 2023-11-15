//
//  MVVMApp.swift
//  SwiftUI-MVVM
//
//  Created by Hangyeol on 11/15/23.
//

import SwiftUI

@main
struct MVVMApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}
