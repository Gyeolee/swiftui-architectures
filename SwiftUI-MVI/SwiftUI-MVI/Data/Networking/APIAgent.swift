//
//  APIAgent.swift
//  SwiftUI-MVI
//
//  Created by Hangyeol on 11/13/23.
//

import Foundation
import Alamofire

struct APIAgent {
    private var session: Session
    
    private var sessionConfiguration: URLSessionConfiguration = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 10
        configuration.timeoutIntervalForResource = 10
        return configuration
    }()
    
    init(interceptor: RequestInterceptor? = APIInterceptor()) {
        session = Session(
            configuration: sessionConfiguration,
            interceptor: interceptor,
            eventMonitors: [APIMonitor()]
        )
    }
    
    func run<T: Decodable>(_ target: APITarget) async throws -> T {
        let url = target.baseURL.appending(path: target.path)
        
        do {
            return try await session
                .request(url, method: target.method, parameters: target.parameters, encoding: target.encoding)
                .validate { _, response, data -> Request.ValidationResult in
                    guard let _ = data, (200...299).contains(response.statusCode) else {
                        switch response.statusCode {
                        case 401:
                            return .failure(AFError.responseValidationFailed(reason: .customValidationFailed(error: SpotifyError(code: .invalidAccessToken))))
                        default:
                            return .failure(AFError.responseValidationFailed(reason: .customValidationFailed(error: SpotifyError(code: .unknown))))
                        }
                    }

                    return .success(())
                }
                .serializingDecodable(T.self)
                .value
        } catch {
            throw error
        }
    }
}
