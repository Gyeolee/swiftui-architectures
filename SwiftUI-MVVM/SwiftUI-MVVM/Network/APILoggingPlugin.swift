//
//  APILoggingPlugin.swift
//  SwiftUI-MVVM
//
//  Created by Hangyeol on 11/15/23.
//

import Foundation
import Moya

final class APILoggingPlugin: PluginType {
    func willSend(_ request: RequestType, target: TargetType) {
        print("🛰 HTTP REQUEST LOG 🛰")
        print(request.request?.description ?? "")
        
        print(
            "URL: " + (request.request?.url?.absoluteString ?? "")  + "\n"
            + "Method: " + (request.request?.httpMethod ?? "") + "\n"
            + "Headers: " + "\(request.request?.allHTTPHeaderFields ?? [:])" + "\n"
        )
        print("Authorization: " + (request.request?.headers["Authorization"] ?? ""))
        print("Body: " + (request.request?.httpBody?.prettyPrintedString ?? "nil"))
    }
    
    func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {
        print("🛰 HTTP RESPONSE LOG 🛰")
        switch result {
        case .success(let response):
            print(
                "URL: " + (response.request?.url?.absoluteString ?? "") + "\n"
                + "Headers " + "\(response.response?.allHeaderFields ?? [:])" + "\n"
                + "Result: " + "\(result)" + "\n"
                + "StatusCode: " + "\(response.response?.statusCode ?? 0)" + "\n"
                + "Data: \(response.data.prettyPrintedString ?? "nil")" + "\n\n"
            )
            
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
}
