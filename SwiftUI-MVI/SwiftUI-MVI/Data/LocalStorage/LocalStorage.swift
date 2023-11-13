//
//  LocalStorage.swift
//  SwiftUI-MVI
//
//  Created by Hangyeol on 11/13/23.
//

import Foundation

struct LocalStorage {
    enum Key: String {
        case accessToken = "AccessToken"
    }
    
    private let defaults: UserDefaults = UserDefaults.standard
    
    func accessToken(_ accessToken: String) {
        defaults.set(accessToken, forKey: Key.accessToken.rawValue)
    }
    
    func accessToken() -> String? {
        defaults.string(forKey: Key.accessToken.rawValue)
    }
}
