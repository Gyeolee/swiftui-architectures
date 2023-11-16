//
//  APIs.swift
//  SwiftUI-MVVM
//
//  Created by Hangyeol on 11/15/23.
//

import Foundation
import Moya

enum API {
    enum AccessToken {
        case token
    }
    
    enum Albums {
        case album(id: String)
        case newReleases(offset: Int)
    }
}

extension API.AccessToken: TargetType {
    var grantType: String { "client_credentials" }
    var clientId: String { "abb41fd721604684a332f4a6b22d83d8" }
    var clientSecret: String { "03d5bb010c9d4736acdc6b9b7ab51a67" }
    
    var baseURL: URL { URL(string: "https://accounts.spotify.com")! }
    
    var path: String {
        switch self {
        case .token:    return "/api/token"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .token:    return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .token:
            let requestParameters = TokenRequestDataModel(
                grantType: grantType,
                clientId: clientId,
                clientSecret: clientSecret
            ).parameters ?? [:]
            return .requestParameters(parameters: requestParameters, encoding: URLEncoding.httpBody)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .token:    return nil
        }
    }
}

extension API.Albums: TargetType {
    var country: String { "KR" }
    var limit: Int { 20 }
    
    var baseURL: URL { URL(string: "https://api.spotify.com/v1")! }
    
    var path: String {
        switch self {
        case let .album(id):    return "/albums/\(id)"
        case .newReleases:      return "/browse/new-releases"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .album:        fallthrough
        case .newReleases:  return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .album:
            return .requestPlain
            
        case let .newReleases(offset):
            let requestParameters = AlbumsRequestDataModel(
                country: country,
                limit: limit,
                offset: offset
            ).parameters ?? [:]
            return .requestParameters(parameters: requestParameters, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        let localStorage: LocalStorage = .init()
        if let accessToken = localStorage.accessToken() {
            return ["Authorization": "Bearer \(accessToken)"]
        }
        return nil
    }
}
