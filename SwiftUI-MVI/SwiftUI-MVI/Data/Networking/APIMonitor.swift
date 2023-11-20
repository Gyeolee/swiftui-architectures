//
//  APIMonitor.swift
//  SwiftUI-MVI
//
//  Created by Hangyeol on 11/13/23.
//

import Alamofire
import Extensions

class APIMonitor: EventMonitor {
    func requestDidFinish(_ request: Request) {
        print("🛰 HTTP REQUEST LOG 🛰")
        print(request.description)
        
        print(
            "URL: " + (request.request?.url?.absoluteString ?? "")  + "\n"
            + "Method: " + (request.request?.httpMethod ?? "") + "\n"
            + "Headers: " + "\(request.request?.allHTTPHeaderFields ?? [:])" + "\n"
        )
        print("Authorization: " + (request.request?.headers["Authorization"] ?? ""))
        print("Body: " + (request.request?.httpBody?.prettyPrintedString ?? "nil"))
    }
    
    func request<Value>(
        _ request: DataRequest,
        didParseResponse response: DataResponse<Value, AFError>
    ) {
        print("🛰 HTTP RESPONSE LOG 🛰")
        print(
            "URL: " + (request.request?.url?.absoluteString ?? "") + "\n"
            + "Headers " + "\(response.response?.allHeaderFields ?? [:])" + "\n"
            + "Result: " + "\(response.result)" + "\n"
            + "StatusCode: " + "\(response.response?.statusCode ?? 0)" + "\n"
            + "Data: \(response.data?.prettyPrintedString ?? "nil")" + "\n\n"
        )
    }
}
