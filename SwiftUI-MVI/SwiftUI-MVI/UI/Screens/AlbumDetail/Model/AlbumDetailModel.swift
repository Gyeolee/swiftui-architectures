//
//  AlbumDetailModel.swift
//  SwiftUI-MVI
//
//  Created by Hangyeol on 11/14/23.
//

import SwiftUI

final class AlbumDetailModel: ObservableObject, AlbumDetailModelStateProtocol {
    @Published var detailState: AlbumDetailState = .init(title: "", imageUrl: "", artistName: "")
    @Published var trackStates: [AlbumDetailTrackState] = []
}

extension AlbumDetailModel: AlbumDetailModelActionsProtocol {
    func update(_ data: AlbumDetailResponseDataModel) {
        detailState = AlbumDetailState(
            title: data.name,
            imageUrl: data.images.first { $0.width == 640 }?.url ?? "",
            artistName: data.artists.map { $0.name }.joined(separator: ", ")
        )
        
        trackStates = data.tracks.items
            .enumerated()
            .map { AlbumDetailTrackState(number: "\($0.offset + 1)", title: $0.element.name) }
    }
}
