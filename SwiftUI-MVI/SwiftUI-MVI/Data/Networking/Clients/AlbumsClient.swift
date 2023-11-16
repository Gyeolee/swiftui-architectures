//
//  AlbumsClient.swift
//  SwiftUI-MVI
//
//  Created by Hangyeol on 11/13/23.
//

import Foundation
import Alamofire

struct AlbumsClient {
    private let agent: APIAgent = .init()
    private let country: String = "KR"
    
    func getNewReleases(offset: Int) async throws -> AlbumNewReleasesResponseDataModel {
        return try await agent.run(APIs.Albums.newReleases(offset: offset))
    }
    
    func getAlbum(id: String) async throws -> AlbumDetailResponseDataModel {
        return try await agent.run(APIs.Albums.album(id: id))
    }
}
