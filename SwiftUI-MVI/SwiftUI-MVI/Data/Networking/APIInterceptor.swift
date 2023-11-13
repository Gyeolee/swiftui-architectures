//
//  APIInterceptor.swift
//  SwiftUI-MVI
//
//  Created by Hangyeol on 11/13/23.
//

import Foundation
import Alamofire

final class APIInterceptor: RequestInterceptor {
    private let tokenClient: TokenClient = .init()
    private let localStorage: LocalStorage = .init()
}

extension APIInterceptor: RequestAdapter {
    func adapt(_ urlRequest: URLRequest,
               for session: Session,
               completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var urlRequest = urlRequest
        
        if let accessToken = localStorage.accessToken() {
            urlRequest.headers.add(.authorization(bearerToken: accessToken))
        }
        
        completion(.success(urlRequest))
    }
}

extension APIInterceptor: RequestRetrier {
    func retry(_ request: Request,
               for session: Session,
               dueTo error: Error,
               completion: @escaping (RetryResult) -> Void) {
        guard let afError = error as? AFError else {
            completion(.doNotRetryWithError(error))
            return
        }
        
        guard case let .responseValidationFailed(reason) = afError,
              case let .customValidationFailed(customError) = reason,
              let spotifyError = customError as? SpotifyError else {
            completion(.doNotRetryWithError(error))
            return
        }
        
        guard spotifyError.code == .invalidAccessToken else {
            completion(.doNotRetry)
            return
        }
        
        Task {
            do {
                let responseModel = try await tokenClient.postToken()
                localStorage.accessToken(responseModel.accessToken)
                completion(.retry)
            } catch {
                completion(.doNotRetryWithError(error))
            }
        }
    }
}
