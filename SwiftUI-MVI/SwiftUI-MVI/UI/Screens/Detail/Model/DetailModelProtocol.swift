//
//  DetailModelProtocol.swift
//  SwiftUI-MVI
//
//  Created by Hangyeol on 11/14/23.
//

protocol DetailModelStateProtocol {
    var imageUrl: String { get }
    var albumName: String { get }
    var artistName: String { get }
    var tracks: [DetailItemView.DetailItemState] { get }
}

protocol DetailModelActionsProtocol {
    func update(_ data: AlbumDetailResponseDataModel)
}
