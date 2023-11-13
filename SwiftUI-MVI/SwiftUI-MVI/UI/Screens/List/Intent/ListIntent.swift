//
//  ListIntent.swift
//  SwiftUI-MVI
//
//  Created by Hangyeol on 11/13/23.
//

class ListIntent: ListIntentProtocol {
    private let actionsModel: ListModelActionsProtocol
    private let albumsClient: AlbumsClient = .init()
    private var offset: Int = 0
    
    init(model: ListModelActionsProtocol) {
        actionsModel = model
    }
    
    func viewOnTask() async {
        do {
            let responseData = try await albumsClient.getNewReleases(offset: offset)
            let albumsData = responseData.albums
            actionsModel.update(albumsData.items)
            
            offset += albumsData.limit
        } catch {
            print(error)
        }
    }
}
