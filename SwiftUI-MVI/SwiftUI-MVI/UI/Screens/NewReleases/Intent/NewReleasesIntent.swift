//
//  NewReleasesIntent.swift
//  SwiftUI-MVI
//
//  Created by Hangyeol on 11/13/23.
//

import Foundation

class NewReleasesIntent: NewReleasesIntentProtocol {
    private let actionsModel: NewReleasesModelActionsProtocol
    private let albumsClient: AlbumsClient = .init()
    private var offset: Int = 0
    
    init(model: NewReleasesModelActionsProtocol) {
        actionsModel = model
    }
    
    func viewOnTask() async {
        do {
            let responseData = try await albumsClient.getNewReleases(offset: offset)
            let albumsData = responseData.albums
            await actionsModel.update(albumsData.items)
            
            offset += albumsData.limit
        } catch {
            print(error)
        }
    }
}
