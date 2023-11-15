//
//  Data+Extension.swift
//  SwiftUI-MVVM
//
//  Created by Hangyeol on 11/15/23.
//

import Foundation

extension Data {
    var prettyPrintedString: String? {
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
              let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return nil }
        return prettyPrintedString as String
    }
}
