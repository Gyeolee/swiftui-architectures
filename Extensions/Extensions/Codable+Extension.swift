//
//  Codable+Extension.swift
//  Extensions
//
//  Created by Hangyeol on 11/20/23.
//

import Foundation

public extension Encodable {
    var parameters: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else {
            return nil
        }
        let jsonObject = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
        return jsonObject.flatMap { $0 as? [String: Any] }
    }
}
