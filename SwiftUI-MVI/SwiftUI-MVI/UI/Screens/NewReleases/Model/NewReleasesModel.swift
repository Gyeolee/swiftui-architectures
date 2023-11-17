//
//  NewReleasesModel.swift
//  SwiftUI-MVI
//
//  Created by Hangyeol on 11/13/23.
//

import SwiftUI

final class NewReleasesModel: ObservableObject, NewReleasesModelStateProtocol {
    @Published var newReleaseAlbumStates: [NewReleaseAlbumState] = []
}

extension NewReleasesModel: NewReleasesModelActionsProtocol {
    func update(_ data: [AlbumItemResponseDataModel]) {
        newReleaseAlbumStates.append(contentsOf: data.map {
            let image = $0.images.first { $0.width == 640 }!
            return NewReleaseAlbumState(
                id: $0.id,
                title: $0.name,
                imageUrl: image.url
            )
        })
    }
}
