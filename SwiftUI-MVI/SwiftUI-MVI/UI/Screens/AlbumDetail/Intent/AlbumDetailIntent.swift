//
//  AlbumDetailIntent.swift
//  SwiftUI-MVI
//
//  Created by Hangyeol on 11/14/23.
//

class AlbumDetailIntent: AlbumDetailIntentProtocol {
    private let actionsModel: AlbumDetailModelActionsProtocol
    private let albumsClient: AlbumsClient = .init()
    private let id: String
    
    init(model: AlbumDetailModelActionsProtocol, detailId: String) {
        actionsModel = model
        id = detailId
    }
    
    func viewOnTask() async {
        do {
            let responseData = try await albumsClient.getAlbum(id: id)
            actionsModel.update(responseData)
        } catch {
            print(error)
        }
    }
}
