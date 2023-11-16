//
//  NewReleasesModelProtocol.swift
//  SwiftUI-MVI
//
//  Created by Hangyeol on 11/13/23.
//

protocol NewReleasesModelStateProtocol {
    var itemStates: [NewReleaseView.ListItemState] { get }
}

protocol NewReleasesModelActionsProtocol {
    func update(_ data: [AlbumItemResponseDataModel])
}
