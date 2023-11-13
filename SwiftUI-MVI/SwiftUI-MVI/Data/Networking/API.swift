//
//  API.swift
//  SwiftUI-MVI
//
//  Created by Hangyeol on 11/13/23.
//

import Foundation

enum API {
    static let baseURL: URL = URL(string: "https://api.spotify.com/v1")!
    static let requestItemsLimit: Int = 20
    
    enum AccessToken {
        case token
        
        var url: URL {
            return URL(string: "https://accounts.spotify.com/api/token")!
        }
    }
    
    enum Albums {
        case album(id: String)
        case newReleases
        
        var url: URL {
            switch self {
            case .album(let id):
                return API.baseURL
                    .appending(path: "albums")
                    .appending(path: "\(id)")
                
            case .newReleases:
                return API.baseURL
                    .appending(path: "browse")
                    .appending(path: "new-releases")
            }
        }
    }
}
