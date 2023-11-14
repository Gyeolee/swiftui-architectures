//
//  DetailModel.swift
//  SwiftUI-MVI
//
//  Created by Hangyeol on 11/14/23.
//

import SwiftUI

final class DetailModel: ObservableObject, DetailModelStateProtocol {
    @Published var imageUrl: String = ""
    @Published var albumName: String = ""
    @Published var artistName: String = ""
    @Published var tracks: [DetailItemView.DetailItemState] = []
}

extension DetailModel: DetailModelActionsProtocol {
    func update(_ data: AlbumDetailResponseDataModel) {
        imageUrl = data.images.first { $0.width == 640 }?.url ?? ""
        albumName = data.name
        artistName = data.artists.map { $0.name }.joined(separator: ", ")
        tracks = data.tracks.items
            .enumerated()
            .map { DetailItemView.DetailItemState(number: "\($0.offset + 1)", title: $0.element.name) }
    }
}
