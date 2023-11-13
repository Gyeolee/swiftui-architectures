//
//  TokenDataModel.swift
//  SwiftUI-MVI
//
//  Created by Hangyeol on 11/13/23.
//

// MARK: - Request Data Model

struct TokenRequestDataModel: Encodable {
    let grantType: String
    let clientId: String
    let clientSecret: String
    
    enum CodingKeys: String, CodingKey {
        case grantType = "grant_type"
        case clientId = "client_id"
        case clientSecret = "client_secret"
    }
}

// MARK: - Response Data Model

struct TokenResponseDataModel: Decodable {
    let accessToken: String
    let tokenType: String
    let expiresIn: Int
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
        case expiresIn = "expires_in"
    }
}
