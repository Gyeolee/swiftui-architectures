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
    
    func getNewReleases(offset: Int,
                        limit: Int = API.requestItemsLimit) async throws -> AlbumNewReleasesResponseDataModel {
        let requestDataModel = AlbumsRequestDataModel(
            country: country,
            limit: limit,
            offset: offset
        )
        return try await agent.run(
            API.Albums.newReleases.url,
            parameters: requestDataModel.parameters
        )
    }
}
