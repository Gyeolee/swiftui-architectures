//
//  AppDelegate.swift
//  SwiftUI-MVI
//
//  Created by Hangyeol on 11/13/23.
//

import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    private let tokenClient: TokenClient = .init()
    private let localStorage: LocalStorage = .init()
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        Task {
            do {
                let responseData = try await tokenClient.postToken()
                localStorage.accessToken(responseData.accessToken)
            } catch {
                print(error)
            }
        }
        
        return true
    }
}
