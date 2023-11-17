//
//  AlbumDetailModelProtocol.swift
//  SwiftUI-MVI
//
//  Created by Hangyeol on 11/14/23.
//

protocol AlbumDetailModelStateProtocol {
    var detailState: AlbumDetailState { get }
    var trackStates: [AlbumDetailTrackState] { get }
}

protocol AlbumDetailModelActionsProtocol {
    func update(_ data: AlbumDetailResponseDataModel)
}
