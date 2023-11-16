//
//  APIs.swift
//  SwiftUI-MVI
//
//  Created by Hangyeol on 11/13/23.
//

import Foundation
import Alamofire

protocol APITarget {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: Parameters? { get }
    var encoding: ParameterEncoding { get }
}

enum APIs {
    enum AccessToken {
        case token
    }
    
    enum Albums {
        case album(id: String)
        case newReleases(offset: Int)
    }
}

extension APIs.AccessToken: APITarget {
    var grantType: String { "client_credentials" }
    var clientId: String { "abb41fd721604684a332f4a6b22d83d8" }
    var clientSecret: String { "03d5bb010c9d4736acdc6b9b7ab51a67" }
    
    var baseURL: URL { URL(string: "https://accounts.spotify.com/api")! }
    
    var path: String {
        switch self {
        case .token:    return "/token"
        }
    }
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .token:    return .post
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .token:
            return TokenRequestDataModel(grantType: grantType, clientId: clientId, clientSecret: clientSecret).parameters
        }
    }
    
    var encoding: ParameterEncoding {
        return URLEncoding.default
    }
}

extension APIs.Albums: APITarget {
    var country: String { "KR" }
    var limit: Int { 20 }
    
    var baseURL: URL { URL(string: "https://api.spotify.com/v1")! }
    
    var path: String {
        switch self {
        case let .album(id):    return "/albums/\(id)"
        case .newReleases:      return "/browse/new-releases"
        }
    }
    
    var method: Alamofire.HTTPMethod {
        return .get
    }
    
    var parameters: Parameters? {
        switch self {
        case .album:
            return nil
            
        case let .newReleases(offset):
            return AlbumsRequestDataModel(country: country, limit: limit, offset: offset).parameters
        }
    }
    
    var encoding: ParameterEncoding {
        return URLEncoding.default
    }
}
