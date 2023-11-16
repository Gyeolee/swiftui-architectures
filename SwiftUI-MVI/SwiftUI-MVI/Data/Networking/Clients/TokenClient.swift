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
        return try await agent.run(APIs.AccessToken.token)
    }
}
