//
//  Codable+Extension.swift
//  SwiftUI-MVI
//
//  Created by Hangyeol on 11/13/23.
//

import Foundation
import Alamofire

extension Encodable {
    var parameters: Parameters? {
        guard let data = try? JSONEncoder().encode(self) else {
            return nil
        }
        let jsonObject = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
        return jsonObject.flatMap { $0 as? Parameters }
    }
}
