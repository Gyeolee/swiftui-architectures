//
//  ModelProtocol.swift
//  SwiftUI-MVI
//
//  Created by Hangyeol on 11/21/23.
//

protocol ModelState {
    var isLoading: Bool { get }
}

@MainActor
protocol ModelActions {
    func loading(_ isLoading: Bool)
}
