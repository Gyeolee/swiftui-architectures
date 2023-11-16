//
//  AlbumDetailModelProtocol.swift
//  SwiftUI-MVI
//
//  Created by Hangyeol on 11/14/23.
//

protocol AlbumDetailModelStateProtocol {
    var detailState: AlbumDetailView.AlbumDetailState { get }
    var trackStates: [AlbumTrackItemView.AlbumTrackItemState] { get }
}

protocol AlbumDetailModelActionsProtocol {
    func update(_ data: AlbumDetailResponseDataModel)
}
