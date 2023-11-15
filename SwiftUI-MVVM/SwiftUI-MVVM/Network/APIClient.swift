//
//  APIClient.swift
//  SwiftUI-MVVM
//
//  Created by Hangyeol on 11/15/23.
//

import Foundation
import Moya

struct APIClient {
    static func request<Target, T>(_ target: Target) async throws -> T where Target: TargetType, T: Decodable {
        try await withCheckedThrowingContinuation { continuation in
            MoyaProvider<Target>(plugins: [APILoggingPlugin()]).request(target) { result in
                switch result {
                case .success(let result):
                    do {
                        let data = try result.map(T.self)
                        continuation.resume(returning: data)
                    } catch {
                        continuation.resume(throwing: error)
                    }
                    
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
