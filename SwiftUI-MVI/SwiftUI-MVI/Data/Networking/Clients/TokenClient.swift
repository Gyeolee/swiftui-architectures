//
//  TokenClient.swift
//  SwiftUI-MVI
//
//  Created by Hangyeol on 11/13/23.
//

import Alamofire

struct TokenClient {
    let agent: APIAgent = .init(interceptor: nil)
    
    func postToken() async throws -> TokenResponseModel {
        let requestModel = TokenRequestModel(
            grantType: APIConfig.grantType,
            clientId: APIConfig.clientId,
            clientSecret: APIConfig.clientSecret
        )
        return try await agent.run(
            API.AccessToken.token.url,
            method: .post,
            parameters: requestModel.parameters,
            encoding: URLEncoding.httpBody
        )
    }
}
