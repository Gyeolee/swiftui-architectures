//
//  ErrorModel.swift
//  SwiftUI-MVI
//
//  Created by Hangyeol on 11/13/23.
//

struct SpotifyError: Error {
    let code: SpotifyErrorCode
    let message: String
    
    init(code: SpotifyErrorCode, message: String = "") {
        self.code = code
        self.message = message
    }
}

enum SpotifyErrorCode: String {
    case unknown
    case invalidAccessToken
}
