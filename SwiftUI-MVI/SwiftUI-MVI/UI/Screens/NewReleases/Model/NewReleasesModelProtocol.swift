//
//  NewReleasesModelProtocol.swift
//  SwiftUI-MVI
//
//  Created by Hangyeol on 11/13/23.
//

protocol NewReleasesModelStateProtocol {
    var newReleaseStates: [NewReleaseState] { get }
}

@MainActor
protocol NewReleasesModelActionsProtocol {
    func update(_ data: [AlbumItemResponseDataModel])
}
