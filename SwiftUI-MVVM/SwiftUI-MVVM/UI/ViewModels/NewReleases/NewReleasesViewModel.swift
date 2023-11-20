//
//  NewReleasesViewModel.swift
//  SwiftUI-MVVM
//
//  Created by Hangyeol on 11/15/23.
//

import SwiftUI

final class NewReleasesViewModel: ObservableObject {
    @MainActor @Published var newReleaseModels: [NewReleaseModel] = []
    
    private var offset: Int = 0
    
    func fetchNewReleases() async {
        do {
            let data: AlbumNewReleasesResponseDataModel = try await APIClient.request(API.Albums.newReleases(offset: offset))
            let albumsData = data.albums
            await MainActor.run {
                newReleaseModels.append(contentsOf: albumsData.items.map {
                    NewReleaseModel(id: $0.id, albumTitle: $0.name, albumImageUrl: $0.images.first { $0.width == 640 }!.url)
                })
            }
            
            offset += albumsData.limit
        } catch {
            print(error)
        }
    }
}
