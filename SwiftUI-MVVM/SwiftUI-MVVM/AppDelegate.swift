//
//  AppDelegate.swift
//  SwiftUI-MVVM
//
//  Created by Hangyeol on 11/15/23.
//

import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
//    private let localStorage: LocalStorage = .init()
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        Task {
            do {
                let data: TokenResponseDataModel = try await APIClient.request(API.AccessToken.token)
//                localStorage.accessToken(responseData.accessToken)
                print(data)
            } catch {
                print(error)
            }
        }
        
        return true
    }
}

