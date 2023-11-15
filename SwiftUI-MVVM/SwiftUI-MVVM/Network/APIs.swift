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
        case newReleases
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
