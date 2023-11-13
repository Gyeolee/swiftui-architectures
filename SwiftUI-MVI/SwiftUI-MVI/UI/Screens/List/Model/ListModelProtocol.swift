//
//  ListModelProtocol.swift
//  SwiftUI-MVI
//
//  Created by Hangyeol on 11/13/23.
//

protocol ListModelStateProtocol {
    var itemStates: [ListItemView.ListItemState] { get }
}

protocol ListModelActionsProtocol {
    func update(_ data: [AlbumItemResponseDataModel])
}
