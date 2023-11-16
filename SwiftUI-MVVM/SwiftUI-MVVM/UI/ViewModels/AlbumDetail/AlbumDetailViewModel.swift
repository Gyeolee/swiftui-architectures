//
//  AlbumDetailViewModel.swift
//  SwiftUI-MVVM
//
//  Created by Hangyeol on 11/16/23.
//

import SwiftUI

final class AlbumDetailViewModel: ObservableObject {
    @MainActor @Published var model: AlbumDetailModel = .init(title: "title", imageUrl: "imageUrl", artistName: "artistName", tracks: [])
    
    func fetchAlbumDetail(id: String) async {
        do {
            let data: AlbumDetailResponseDataModel = try await APIClient.request(API.Albums.album(id: id))
            await MainActor.run {
                model.title = data.name
                model.imageUrl = data.images.first { $0.width == 640 }?.url ?? ""
                model.artistName = data.artists.map { $0.name }.joined(separator: ", ")
                model.tracks = data.tracks.items
                    .enumerated()
                    .map { AlbumTrackModel(number: "\($0.offset + 1)", title: $0.element.name) }
            }
        } catch {
            print(error)
        }
    }
}
