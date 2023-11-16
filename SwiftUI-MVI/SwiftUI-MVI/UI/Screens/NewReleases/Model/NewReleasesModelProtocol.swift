//
//  NewReleasesModelProtocol.swift
//  SwiftUI-MVI
//
//  Created by Hangyeol on 11/13/23.
//

protocol NewReleasesModelStateProtocol {
    var itemStates: [NewReleaseView.NewReleaseItemState] { get }
}

protocol NewReleasesModelActionsProtocol {
    func update(_ data: [AlbumItemResponseDataModel])
}