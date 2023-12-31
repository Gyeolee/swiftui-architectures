//
//  NewReleasesModel.swift
//  SwiftUI-MVI
//
//  Created by Hangyeol on 11/13/23.
//

import SwiftUI

// MARK: - Protocols

protocol NewReleasesModelStateProtocol: ModelState {
    var newReleaseStates: [NewReleaseState] { get }
}

@MainActor
protocol NewReleasesModelActionsProtocol: ModelActions {
    func update(_ data: [AlbumItemResponseDataModel])
}


// MARK: - Model

final class NewReleasesModel: ObservableObject, NewReleasesModelStateProtocol {
    @MainActor @Published var isLoading: Bool = true
    @MainActor @Published var newReleaseStates: [NewReleaseState] = []
}

extension NewReleasesModel: NewReleasesModelActionsProtocol {
    func loading(_ isLoading: Bool) {
        withAnimation {
            self.isLoading = isLoading
        }
    }
    
    func update(_ data: [AlbumItemResponseDataModel]) {
        newReleaseStates.append(contentsOf: data.map {
            NewReleaseState(id: $0.id, title: $0.name, imageUrl: $0.images.first { $0.width == 640 }!.url)
        })
    }
}
