//
//  Array+Extension.swift
//  Extensions
//
//  Created by Hangyeol on 11/20/23.
//

import Foundation

public extension Array {
    var withIndices: [(Int, Element)] {
        return Array<(Int, Element)>(zip(self.indices, self))
    }
}
