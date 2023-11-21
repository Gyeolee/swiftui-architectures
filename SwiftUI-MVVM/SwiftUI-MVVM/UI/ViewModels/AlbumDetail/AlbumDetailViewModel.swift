//
//  AlbumDetailViewModel.swift
//  SwiftUI-MVVM
//
//  Created by Hangyeol on 11/16/23.
//

import SwiftUI

final class AlbumDetailViewModel: ObservableObject, ViewModelable {
    @MainActor @Published var isLoading: Bool = true
    @MainActor @Published var detailModel: AlbumDetailModel = .init(title: "title", imageUrl: "imageUrl", artistName: "artistName")
    @MainActor @Published var trackModels: [AlbumDetailTrackModel] = []
    
    func fetchAlbumDetail(id: String) async {
        do {
            let data: AlbumDetailResponseDataModel = try await APIClient.request(API.Albums.album(id: id))
            await MainActor.run {
                detailModel.title = data.name
                detailModel.imageUrl = data.images.first { $0.width == 640 }?.url ?? ""
                detailModel.artistName = data.artists.map { $0.name }.joined(separator: ", ")
                
                trackModels = data.tracks.items
                    .enumerated()
                    .map { AlbumDetailTrackModel(number: "\($0.offset + 1)", title: $0.element.name) }
            }
        } catch {
            print(error)
        }
        
        await loading(false)
    }
}
