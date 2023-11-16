//
//  AlbumDetailModel.swift
//  SwiftUI-MVI
//
//  Created by Hangyeol on 11/14/23.
//

import SwiftUI

final class AlbumDetailModel: ObservableObject, AlbumDetailModelStateProtocol {
    @Published var imageUrl: String = ""
    @Published var albumName: String = ""
    @Published var artistName: String = ""
    @Published var tracks: [AlbumTrackItemView.DetailItemState] = []
}

extension AlbumDetailModel: AlbumDetailModelActionsProtocol {
    func update(_ data: AlbumDetailResponseDataModel) {
        imageUrl = data.images.first { $0.width == 640 }?.url ?? ""
        albumName = data.name
        artistName = data.artists.map { $0.name }.joined(separator: ", ")
        tracks = data.tracks.items
            .enumerated()
            .map { AlbumTrackItemView.DetailItemState(number: "\($0.offset + 1)", title: $0.element.name) }
    }
}
