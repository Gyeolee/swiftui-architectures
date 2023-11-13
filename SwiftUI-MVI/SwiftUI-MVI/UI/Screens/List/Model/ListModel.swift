//
//  ListModel.swift
//  SwiftUI-MVI
//
//  Created by Hangyeol on 11/13/23.
//

import SwiftUI

final class ListModel: ObservableObject, ListModelStateProtocol {
    @Published var itemStates: [ListItemView.ListItemState] = []
}

extension ListModel: ListModelActionsProtocol {
    func update(_ data: [AlbumItemResponseDataModel]) {
        itemStates.append(contentsOf: data.map {
            let image = $0.images.first { $0.width == 640 }!
            return ListItemView.ListItemState(
                id: $0.id,
                title: $0.name,
                imageUrl: image.url
            )
        })
    }
}
