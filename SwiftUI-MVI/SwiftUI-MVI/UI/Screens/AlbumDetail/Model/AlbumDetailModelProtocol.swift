//
//  AlbumDetailModelProtocol.swift
//  SwiftUI-MVI
//
//  Created by Hangyeol on 11/14/23.
//

protocol AlbumDetailModelStateProtocol {
    var imageUrl: String { get }
    var albumName: String { get }
    var artistName: String { get }
    var tracks: [AlbumTrackItemView.DetailItemState] { get }
}

protocol AlbumDetailModelActionsProtocol {
    func update(_ data: AlbumDetailResponseDataModel)
}
