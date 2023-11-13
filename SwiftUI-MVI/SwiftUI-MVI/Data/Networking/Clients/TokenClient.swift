//
//  TokenClient.swift
//  SwiftUI-MVI
//
//  Created by Hangyeol on 11/13/23.
//

import Alamofire

struct TokenClient {
    private let agent: APIAgent = .init(interceptor: nil)
    
    func postToken() async throws -> TokenResponseDataModel {
        let requestDataModel = TokenRequestDataModel(
            grantType: APIConfig.grantType,
            clientId: APIConfig.clientId,
            clientSecret: APIConfig.clientSecret
        )
        return try await agent.run(
            API.AccessToken.token.url,
            method: .post,
            parameters: requestDataModel.parameters,
            encoding: URLEncoding.httpBody
        )
    }
}
