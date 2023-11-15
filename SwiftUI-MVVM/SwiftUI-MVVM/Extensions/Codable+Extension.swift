//
//  Codable+Extension.swift
//  SwiftUI-MVVM
//
//  Created by Hangyeol on 11/15/23.
//

import Foundation

extension Encodable {
    var parameters: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else {
            return nil
        }
        let jsonObject = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
        return jsonObject.flatMap { $0 as? [String: Any] }
    }
}

