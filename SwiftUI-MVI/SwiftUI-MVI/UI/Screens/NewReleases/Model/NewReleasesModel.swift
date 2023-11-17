//
//  NewReleasesModel.swift
//  SwiftUI-MVI
//
//  Created by Hangyeol on 11/13/23.
//

import SwiftUI

final class NewReleasesModel: ObservableObject, NewReleasesModelStateProtocol {
    @Published var newReleaseStates: [NewReleaseState] = []
}

extension NewReleasesModel: NewReleasesModelActionsProtocol {
    func update(_ data: [AlbumItemResponseDataModel]) {
        newReleaseStates.append(contentsOf: data.map {
            NewReleaseState(id: $0.id, title: $0.name, imageUrl: $0.images.first { $0.width == 640 }!.url)
        })
    }
}
